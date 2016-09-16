# IntelliJ XQuery Plugin

[![Build Status](https://travis-ci.org/rhdunn/xquery-intellij-plugin.svg)](https://travis-ci.org/rhdunn/xquery-intellij-plugin)
[![codecov.io](https://codecov.io/github/rhdunn/xquery-intellij-plugin/coverage.svg)](https://codecov.io/github/rhdunn/xquery-intellij-plugin)

- [Features](#features)
  - [Language Support](#language-support)
  - [Warnings and Errors](#warnings-and-errors)
  - [References and Resolve](#references-and-resolve)
- [License Information](#license-information)

----------

This project provides XQuery support for the IntelliJ IDE.

_Supported IntelliJ Platforms:_ IntelliJ IDEA Community, IntelliJ IDEA Ultimate,
PhpStorm, WebStorm, PyCharm, RubyMine, AppCode, CLion, Rider, Android Studio

_Supported IntelliJ Versions:_ 2016.1 - 2016.2

_Supported XQuery Versions:_ XQuery 1.0

_Supported XQuery Extensions:_ Update Facility 1.0

_Supported XQuery Implementations:_ MarkLogic, Saxonica, W3C Specifications

## Features

### Language Support

Standard conforming XQuery 1.0 syntax highlighter and parser with file encoding
detection.

![Syntax Highlighting](images/syntax-highlighting.png)

Control over how XQuery dialects are interpreted.

![XQuery Settings](images/xquery-settings.png)

## Warnings and Errors

Helpful error messages for invalid XQuery constructs.

![Error Messages](images/error-messages.png)

Warnings for XQuery constructs that are valid in a different version or extension
to the one configured in the project.

![Require Different Version](images/require-different-version.png)

## References and Resolve

Resolve URI string literals to the files they reference.

![Resolve URI Literals](images/resolve-uriliteral.png)

## License Information

Copyright (C) 2016 Reece H. Dunn

The IntelliJ XQuery Plugin is licensed under the [Apache 2.0](LICENSE)
license.
