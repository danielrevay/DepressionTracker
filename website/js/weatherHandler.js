//api key 3cacfd33186d4639bbf04238211804
//api.openweathermap.org/data/2.5/forecast?zip=${zip}&appid=${apiKey}
var forecast = {}
var zipcode = 0
var currentDay = 0
var currentSeason = getSeason(new Date().getMonth())

var currentMonth = new Date().getMonth();

var currentYear = new Date().getFullYear();
var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
var currentDate = new Date().getDate();
currentMonth = monthNames[currentMonth]

function getWeather(zip) {
  $.getJSON(`http://api.weatherapi.com/v1/forecast.json?key=3cacfd33186d4639bbf04238211804&q=${zip}&days=4&aqi=no&alerts=yes`, function(data) {
    forecast = data
    console.log(data)
    fillFrame()
  });
}


function fillFrame(){
  $("#cont").html("")

  var warning = ""

  if (forecast.current.temp_f < 60 || forecast.current.condition.text.includes("rain") || forecast.current.condition.text.includes("snow")){
    warning = `<h5 class="mt-3"><strong>Possibly Hard Day Ahead!</strong></h5>
    <div class="col-10 offset-1">
    <h6>It's been shown that weather has a larger impact on our moods than most of us know. If you're having a hard day please reference your self care plan and remember to always take depression one day at a time!</h6>
    </div>`
  }
  else{
    warning = `<h5 class="mt-3"><strong>Nice Day Outside!</strong></h5>
    <div class="col-10 offset-1">
    <h6>You should make time to go outside and exercise, or just relax in the fresh air today. It's going to be nice and warm with no bad weather in sight!</h6>
    </div>`
  }

  frame = `
  <!-- frame -->
  <h1>${currentMonth} ${currentDate}</h1>

  <div class="row justify-content-center mt-4">
      <!-- weather icon -->
      <img src=${forecast.current.condition.icon} alt="">
      <!--temp F-->
      <h1 class="mt-2">${forecast.current.temp_f}</h1>
      <!-- location -->
      <div class="col-4 text-left">
        <!--city / state -->
        <h5>${forecast.location.name}, ${forecast.location.region}:</h5>
        <!--conditions -->
        <h6>${forecast.current.condition.text}</h6>
      </div>
  </div>

  ${warning}

  <!-- end frame -->
  `
  $("#cont").html(frame)
}


// get season to decorate
function getSeason(month) {
    if (3 <= month <= 5) {
        return 'spring';
    }
    else if (6 <= month <= 8) {
        return 'summer';
    }
    else if (9 <= month <= 11) {
        return 'fall';
    }
    return 'winter';
}

function swapimage(){
  if (currentSeason == "winter"){
    $("#mainLogo").attr("src","../images/logo/winter.svg")
  }
  else if(currentSeason == "spring"){
    $("#mainLogo").attr("src","../images/logo/spring.svg")
  }
}

$("#submit").click(function(){
  //decorate the page approprately
  swapimage()
  //get the weather
  console.log($("#zipBox").val())
  getWeather( $("#zipBox").val() )
})