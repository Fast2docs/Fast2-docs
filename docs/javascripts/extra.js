// External links opened in new tabs
document$.subscribe(function() {
  var links = document.querySelectorAll("a[href*='http']")
  links.forEach(function(link) {
      link.setAttribute("target", "_blank")
      link.setAttribute("rel", "noopener")
      link.classList.add("external-link")
    })
})

// Copy permanent links to keyboard
document$.subscribe(function () {
    var titles = document.querySelectorAll('h2,h3,h4,h5');
    Array.from(titles).forEach(title => {
        title.onclick = function () {
            location.hash = "";
            copyTextToClipboard(location + "#" + title.id);
        }
    });
})

async function copyTextToClipboard(text) {
    try {
        await navigator.clipboard.writeText(text);
        console.log(text)
    } catch (err) {
        console.error('Error in copying text: ', err);
    }
}
