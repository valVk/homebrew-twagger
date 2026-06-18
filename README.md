# Homebrew TUIagger

Homebrew tap for [tuiagger](https://github.com/valVK/tuiagger) — a TUI Swagger/OpenAPI documentation viewer.

## Install

```bash
brew tap valVK/tuiagger
brew trust valVK/tuiagger
brew install tuiagger
```

> Homebrew requires explicit trust for third-party taps before loading their formulas. `brew trust` only needs to be run once.

## Usage

```bash
# Load from a saved collection
tuiagger <collection-name>

# Load from a local file
tuiagger ./openapi.json

# Load from a URL
tuiagger https://petstore3.swagger.io/api/v3/openapi.json

# List saved collections
tuiagger --list
```

## Collections

Collections are stored in `~/.tuiagger/<name>/`. Drop an `openapi.json` (or `.yaml`) file there:

```bash
mkdir -p ~/.tuiagger/MyAPI
cp openapi.json ~/.tuiagger/MyAPI/
tuiagger MyAPI
```

## Update

```bash
brew upgrade tuiagger
```

## Uninstall

```bash
brew uninstall tuiagger
brew untap valVK/tuiagger
```
