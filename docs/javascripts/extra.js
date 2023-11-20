// External links opened in new tabs
document$.subscribe(function () {
  var links = document.querySelectorAll("a[href^='http']");
  links.forEach(function (link) {
    link.setAttribute("target", "_blank");
    link.setAttribute("rel", "noopener");
    link.classList.add("external-link");
  });
});

// Copy permanent links to keyboard
document$.subscribe(function () {
  var titles = document.querySelectorAll("h2,h3,h4,h5");
  Array.from(titles).forEach((title) => {
    title.onclick = function () {
      location.hash = "";
      copyTextToClipboard(location + "#" + title.id);
    };
  });
});

async function copyTextToClipboard(text) {
  try {
    await navigator.clipboard.writeText(text);
    console.log(text);
  } catch (err) {
    console.error("Error in copying text: ", err);
  }
}

//FIX SCRIPT ISSUE
document$.subscribe(function () {
  var localIsClean = localStorage.getItem("clean") == "true";

  if (!localIsClean) {
    localStorage.clear();
    localStorage.setItem("clean", "true");
    console.log("clean localstorage");
  }
});


function generatePopup() {
  var popupContainer = document.createElement("div");
  popupContainer.className = "popup-container hidden";
  popupContainer.innerHTML = `
    <div class="popup-icon">
      <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
      </svg>
    </div>
    <div class="popup-content">
      <p class="text-sm text-gray-700 dark:text-gray-400">
        You don't find what you want ? <br>
        Did you check the <a href="https://arondor.atlassian.net/jira/servicedesk/projects/TMAFAST/knowledge/articles">Knowledge Base</a> ?
      </p>
      <button class="dont-show-again-btn">Don't show again</button>
    </div>
  `;
  document.body.appendChild(popupContainer);

  var dontShowAgainBtn = popupContainer.querySelector(".dont-show-again-btn");
  dontShowAgainBtn.addEventListener("click", function () {
    sessionStorage.setItem("popupHidden", "true");
    popupContainer.classList.add("hidden");
  });
}
var lastScrollPosition = 0;
function checkPos() {
  if (!sessionStorage.getItem("popupHidden")) {
    var popupContainer = document.querySelector(".popup-container");
    var currentScrollPosition = window.scrollY;
    if (currentScrollPosition < lastScrollPosition) {
      if (currentScrollPosition >= document.documentElement.scrollHeight / 2) {
        if (popupContainer.classList.contains("hidden")) {
          popupContainer.classList.remove("hidden");
          setTimeout(function () {
            popupContainer.classList.add("hidden");
            sessionStorage.removeItem("popupHidden");
          }, 5000);
        }
      }
    }

    lastScrollPosition = currentScrollPosition;
  }
}

window.addEventListener("scroll", checkPos);

window.addEventListener("beforeunload", function () {
  sessionStorage.removeItem("popupHidden");
});

generatePopup();

function checkResultSearchBar() {
  var metaDiv = document.querySelector('div.md-search-result__meta');

  if (metaDiv && metaDiv.textContent.trim() === 'No matching documents') {
      if (!metaDiv.querySelector('button')) {
          var newBtn = document.createElement('button');
          newBtn.textContent = 'Search in Knolage Base';
          newBtn.classList.add('search-btn');
          metaDiv.appendChild(newBtn);
          newBtn.addEventListener('click', function () {
            window.location.href = "https://arondor.atlassian.net/jira/servicedesk/projects/TMAFAST/knowledge/articles";
          });
      }
  }
}

setInterval(checkResultSearchBar, 5000);