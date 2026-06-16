# homebrew-twagger

Homebrew tap for [twagger](https://github.com/valVK/twagger) — a TUI Swagger/OpenAPI documentation viewer.

## Install

```bash
brew tap valVK/twagger
brew install twagger
```

## Usage

```bash
# Load from a saved collection
twagger <collection-name>

# Load from a local file
twagger ./openapi.json

# Load from a URL
twagger https://petstore3.swagger.io/api/v3/openapi.json

# List saved collections
twagger --list
```

## Collections

Collections are stored in `~/.twagger/<name>/`. Drop an `openapi.json` (or `.yaml`) file there:

```bash
mkdir -p ~/.twagger/MyAPI
cp openapi.json ~/.twagger/MyAPI/
twagger MyAPI
```

## Update

```bash
brew upgrade twagger
```

## Uninstall

```bash
brew uninstall twagger
brew untap valVK/twagger
```
