# See LICENSE for licensing information.

PROJECT = cowboy

DIALYZER = dialyzer
REBAR?=rebar



all: app

dev: devbuild

# Application.

deps/ranch:
	@$(REBAR) get-deps

app: deps/ranch
	@$(REBAR) compile

clean:
	@$(REBAR) clean
	rm -f test/*.beam
	rm -f erl_crash.dump

docs: clean-docs dev
	@$(REBAR) -v -C rebar_dev.config doc skip_deps=true

clean-docs:
	rm -f doc/*.css
	rm -f doc/*.html
	rm -f doc/*.png
	rm -f doc/edoc-info

# development
#
devclean:
	$(REBAR) -C rebar_dev.config clean

devbuild: devdeps
	$(REBAR) -C rebar_dev.config compile

devdeps:
	$(REBAR) -C rebar_dev.config get-deps



# Tests.

deps/proper:
	@$(REBAR) -C rebar.tests.config get-deps
	cd deps/proper && $(REBAR) compile

tests: clean deps/proper app eunit ct

inttests: clean deps/proper app eunit intct

eunit:
	@$(REBAR) -C rebar.tests.config eunit skip_deps=true

ct:
	@$(REBAR) -C rebar.tests.config ct skip_deps=true suites=http,ws

intct:
	@$(REBAR) -C rebar.tests.config ct skip_deps=true suites=http,ws,autobahn

# Dialyzer.

build-plt:
	@$(DIALYZER) --build_plt --output_plt .$(PROJECT).plt \
		--apps kernel stdlib sasl inets crypto public_key ssl deps/*

dialyze:
	@$(DIALYZER) --src src --plt .$(PROJECT).plt --no_native \
		-Werror_handling -Wrace_conditions -Wunmatched_returns # -Wunderspecs
