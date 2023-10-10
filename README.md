# Page-load Extension For Quarto

Sometimes you have heavy assets and your page looks broken with those 
assets partially loaded. 

page-load hides all of that behind an overlay for you.

## Installing

```bash
quarto add niniack/page-load
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Using

Add `page-load` as a filter. Then, you can add a `page-load-svg` tag as well. It is not necessary because there is a fallback animation.

```
---
title: "Example"
filters:
  - page-load
page-load-svg: "https://example.com/path/to/custom.svg"
---
```

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

