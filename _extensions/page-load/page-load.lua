if quarto.doc.is_format("html:js") then
	-- fetch SVG URL from metadata, or use default if not provided
	local svgURL
	if quarto.doc.metadata and quarto.doc.metadata["svg-url"] then
		svgURL = quarto.doc.metadata["svg-url"]
	else
		svgURL = "_extensions/page-load/resources/dual_ball.svg"
	end

	-- load external library
	quarto.doc.add_html_dependency({
		name = "ldloader",
		scripts = { "resources/js/ldloader.min.js" },
		stylesheets = { "resources/css/ldloader.min.css" },
	})

	-- define html object with the fetched or default SVG URL
	local inlineHTML = [[
    <!-- Loader Element -->
    <img class="ldld full" src="]] .. svgURL .. [["></div>
  ]]

	-- js to handle logic
	local inlineScript = [[
    <script>
      // Activate the loader
      document.addEventListener("DOMContentLoaded", function() {
        var loader = new ldloader({root: ".ldld.full"});
        loader.on();
        console.log(loader);

        // Deactivate the loader once the page is fully loaded
        window.addEventListener("load", function() {
            loader.off();
        });
      });
    </script>
  ]]

	-- inject js
	quarto.doc.include_text("in-header", inlineScript)

	-- load overlay
	quarto.doc.include_text("after-body", inlineHTML)
end
