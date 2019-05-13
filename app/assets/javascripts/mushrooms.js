class MushroomManager {
  constructor() {
    this.mushroomAttributeSelectors = document.getElementsByClassName("mushroom-attr-selector");
    this.resetButton = document.getElementById("resetButton");
    this.returnList = document.getElementById("resultslist");

    this.bindResetButton();
    this.bindMushroomAttributeSelectors();
  }

  bindResetButton() {
    let self = this;
    this.resetButton.addEventListener("click", function() {
      for (let index in Array.from(self.mushroomAttributeSelectors)) {
        self.mushroomAttributeSelectors[index].value = "";
      }
      self.getMushrooms();
    })
  }

  bindMushroomAttributeSelectors() {
    let self = this;
    for (let mushroomAttributeSelector of this.mushroomAttributeSelectors) {
      mushroomAttributeSelector.addEventListener("change", function(){
        self.getMushrooms(this.mushroomAttributeSelectors);
      });
    }
  }

  getMushrooms()  {
    let self = this;
    Rails.ajax({
      url: "/mushrooms.json",
      data: this.selectedMushroomAttributes(),
      type: "GET",
      success: function(data) {
        self.constructListOfMushrooms(self.returnList, data);
      }
    });
  }

  selectedMushroomAttributes() {
    let mushroomAttributeArray = Array.from(this.mushroomAttributeSelectors);
    let mushroomNameValuePairs = mushroomAttributeArray.map(mushroom => `${mushroom.name}=${mushroom.value}`);
    return mushroomNameValuePairs.join("&");
  }

  constructListOfMushrooms(returnList, mushroomData) {
    returnList.innerHTML = "";

    for (let index in mushroomData) {
      let newLI = document.createElement("li");
      newLI.appendChild(document.createTextNode(mushroomData[index]));
      returnList.appendChild(newLI);
    }
  }
}

let mushroomManager = new MushroomManager();
mushroomManager.getMushrooms();
