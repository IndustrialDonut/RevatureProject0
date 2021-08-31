

// We can specify event listeners to call code when events are triggered
window.onload = () => {
   
   
    //let drawBtn = document.querySelector("#shuffle-btn");
    //apiBtn.addEventListener("click", shuffleRequest);

    
    let shuffleBtn = document.querySelector("#draw-btn");
    shuffleBtn.addEventListener("click", drawRequest);

}

// Best practices when manipulating element styles is to only manipulate their classes
function shuffleRequest(event) {
    let target = event.currentTarget;

    // We can stop all event propagation with the stopPropagation() method
    event.stopPropagation();


    let ajaxRequest = new XMLHttpRequest();
    ajaxRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.responseText;
            response = JSON.parse(response);
            populate(response);
        }
    };

    // Open the request: Method, URL, isAsynchronous
    ajaxRequest.open("GET", "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1", true);
    ajaxRequest.send();
}

function drawRequest(event) {
    let target = event.currentTarget;

    // We can stop all event propagation with the stopPropagation() method
    event.stopPropagation();


    let ajaxRequest = new XMLHttpRequest();
    ajaxRequest.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.responseText;
            response = JSON.parse(response);
            populate(response);
        }
    };

    // Open the request: Method, URL, isAsynchronous
    ajaxRequest.open("GET", "https://deckofcardsapi.com/api/deck/new/draw/?count=2", true); // using new for first test before deck id
    ajaxRequest.send();
}


function populate(requestData) {
    //let pkmName = requestData["name"];
    //let typeData = requestData["types"];
    ///let allTypes = [];
    //let spriteURL = requestData["sprites"]["front_default"];
	
	
	let success = requestData["success"];
	let firstCard = requestData["cards"][0]["image"];
	let secondCard = requestData["cards"][1]["image"];
	
	
    let spriteContainer1 = document.querySelector("#result-image1");
	let spriteContainer2 = document.querySelector("#result-image2");
	
	
	
    //let typeContainer = document.querySelector("#result-data");
    //let typeHTML = "";

    //pkmName = capitalize(pkmName);

    //for (let d of typeData) {
    //    allTypes.push(d["type"]["name"]);
    //}

    spriteContainer1.innerHTML = "<img src=\"" + firstCard + "\" />";
	spriteContainer2.innerHTML = "<img src=\"" + secondCard + "\" />";
	
	
	
	
    //document.querySelector("#result-text").innerHTML = pkmName;
	
	//class=\"sprite\"

    //for (let type of allTypes) {
    //    typeHTML += "<span class=\"type\">" + capitalize(type) + "</span>";
    //}
    //typeContainer.innerHTML = typeHTML;
}

//function capitalize(inputString) {
//    let char1 = inputString[0].toUpperCase();
//    return char1 + inputString.substring(1).toLowerCase();
//}