function init () {
    var fieldset = document.getElementsByTagName('input');
    for (var i = 0; i < fieldset.length; i++) {
        fieldset[i].addEventListener('click', toggle, false);
    }
}

function toggle() {
    var id = this.id;
    switch (id) {
        case "FLtoggle": {
            var floating = document.getElementsByClassName("floating");
            for (var i = 0; i < floating.length; i++) {
                floating[i].classList.toggle("on")
            }
        };
        break;
        case "NEtoggle": {
            var nested = document.getElementsByClassName("nested");
            for (var i = 0; i < nested.length; i++) {
                nested[i].classList.toggle("on")
            }
        };
        break;
        case "PLtoggle": {
            var placeName = document.getElementsByClassName("placeName");
            for (var i = 0; i < placeName.length; i++) {
                placeName[i].classList.toggle("on")
            }
        };
        break;
    }
  }

window.onload = init;