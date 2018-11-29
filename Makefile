pypi:
	@if [ -d "dist/" ]; then rm -rf dist/; fi
	@if [ -d "build/" ]; then rm -rf build/; fi
	@python setup.py sdist bdist_wheel
	@twine upload dist/*
	@git tag v$$(grep __version__ pydng/pydng.py | cut -d'"' -f 2)
	@git push --tags

package:
	@if [ -d "dist/" ]; then rm -rf dist/; fi
	@if [ -d "build/" ]; then rm -rf build/; fi
	@python setup.py sdist bdist_wheel

tag:
	@git tag v$$(grep __version__ pydng/pydng.py | cut -d'"' -f 2)
	@git push --tags
