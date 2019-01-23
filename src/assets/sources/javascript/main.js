
//shift + alt + f autoFormat
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var yyyy = today.getFullYear();
if (dd < 10) {
    dd = '0' + dd;
}
if (mm < 10) {
    mm = '0' + mm;
}
today = dd + '-' + mm + '-' + yyyy;
document.getElementById("middle_date").innerHTML = today;

//custom functions

function set_display(class_name, new_display_style) {
    var x = document.getElementsByClassName(class_name);
    for (var i = 0; i < x.length; i++) {
        x[i].style.display = new_display_style;
    }
}

function set_divContent(divId, new_content) {
    document.getElementById(divId).innerHTML = new_content;
}

function display_only(class_name) {
    set_display("tartalomjegyzek", "none");
    set_display("1fejezet", "none");
    set_display("2fejezet", "none");
    set_display("3fejezet", "none");
    set_display("4fejezet", "none");
    set_display("5fejezet", "none");
    set_display("6fejezet", "none");
    set_display("7fejezet", "none");
    //hida all, than block the choosen one
    set_display(class_name, "block");
}

//csak a kattintott fejezet megjelenitese

var button = document.getElementById("tartalomjegyzek-btn");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Tartalomjegyzék: ");
    display_only("tartalomjegyzek");
});

var button = document.getElementById("dropdown-btn1");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Grafikusan megoldható feladatok: ");
    display_only("1fejezet");
});

var button = document.getElementById("dropdown-btn2");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Szipmlex módszerrel megoldható feladatok: ");
    display_only("2fejezet");
});

var button = document.getElementById("dropdown-btn3");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Érzékenység vizsgálat: ");
    display_only("3fejezet");
});

var button = document.getElementById("dropdown-btn4");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Szállítási feladatok: ");
    display_only("4fejezet");
});

var button = document.getElementById("dropdown-btn5");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Hozzárendelési feladatok: ");
    display_only("5fejezet");
});

var button = document.getElementById("dropdown-btn6");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Egészértékű programozási feladatok: ");
    display_only("6fejezet");
});

var button = document.getElementById("dropdown-btn7");
button.addEventListener("click", function () {
    set_divContent("middle_cim", "Hálózati folyam feladatok: ");
    display_only("7fejezet");
});

//Dropdown le/ fel swap

var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
}


//functions for 1.FEJEZET BUTTONS

function myFunction1F_elmeleti() {
    set_divContent("middle_cim", "I./ Elmélet: ");
    display_only("1fejezet");
    document.getElementById("1.1").style.display = "block";
    document.getElementById("1.2").style.display = "none";
    document.getElementById("1.3").style.display = "none";
}

function myFunction1F_kidolgozott() {
    set_divContent("middle_cim", "I./ Kidolgozott példák: ");
    display_only("1fejezet");
    document.getElementById("1.2").style.display = "block";
    document.getElementById("1.1").style.display = "none";
    document.getElementById("1.3").style.display = "none";
}

function myFunction1F_feladatok() {
    set_divContent("middle_cim", "I./ Feladatok: ");
    display_only("1fejezet");
    document.getElementById("1.3").style.display = "block";
    document.getElementById("1.1").style.display = "none";
    document.getElementById("1.2").style.display = "none";
}

//functions for 2.FEJEZET BUTTONS

function myFunction2F_elmeleti() {
    set_divContent("middle_cim", "II./ Elmélet: ");
    display_only("2fejezet");
    document.getElementById("2.1").style.display = "block";
    document.getElementById("2.2").style.display = "none";
    document.getElementById("2.3").style.display = "none";
}

function myFunction2F_kidolgozott() {
    set_divContent("middle_cim", "II./ Kidolgozott példák: ");
    display_only("2fejezet");
    document.getElementById("2.2").style.display = "block";
    document.getElementById("2.1").style.display = "none";
    document.getElementById("2.3").style.display = "none";
}

function myFunction2F_feladatok() {
    set_divContent("middle_cim", "II./ Feladatok: ");
    display_only("2fejezet");
    document.getElementById("2.3").style.display = "block";
    document.getElementById("2.1").style.display = "none";
    document.getElementById("2.2").style.display = "none";
}

//functions for 3.FEJEZET BUTTONS

function myFunction3F_elmeleti() {
    set_divContent("middle_cim", "III./ Elmélet: ");
    display_only("3fejezet");
    document.getElementById("3.1").style.display = "block";
    document.getElementById("3.2").style.display = "none";
    document.getElementById("3.3").style.display = "none";
}

function myFunction3F_kidolgozott() {
    set_divContent("middle_cim", "III./ Kidolgozott példák: ");
    display_only("3fejezet");
    document.getElementById("3.2").style.display = "block";
    document.getElementById("3.1").style.display = "none";
    document.getElementById("3.3").style.display = "none";
}

function myFunction3F_feladatok() {
    set_divContent("middle_cim", "III./ Feladatok: ");
    display_only("3fejezet");
    document.getElementById("3.3").style.display = "block";
    document.getElementById("3.1").style.display = "none";
    document.getElementById("3.2").style.display = "none";
}

//functions for 4.FEJEZET BUTTONS

function myFunction4F_elmeleti() {
    set_divContent("middle_cim", "IV./ Elmélet: ");
    display_only("4fejezet");
    document.getElementById("4.1").style.display = "block";
    document.getElementById("4.2").style.display = "none";
    document.getElementById("4.3").style.display = "none";
}

function myFunction4F_kidolgozott() {
    set_divContent("middle_cim", "IV./ Kidolgozott példák: ");
    display_only("4fejezet");
    document.getElementById("4.2").style.display = "block";
    document.getElementById("4.1").style.display = "none";
    document.getElementById("4.3").style.display = "none";
}

function myFunction4F_feladatok() {
    set_divContent("middle_cim", "IV./ Feladatok: ");
    display_only("4fejezet");
    document.getElementById("4.3").style.display = "block";
    document.getElementById("4.1").style.display = "none";
    document.getElementById("4.2").style.display = "none";
}

//functions for 5.FEJEZET BUTTONS

function myFunction5F_elmeleti() {
    set_divContent("middle_cim", "V./ Elmélet: ");
    display_only("5fejezet");
    document.getElementById("5.1").style.display = "block";
    document.getElementById("5.2").style.display = "none";
    document.getElementById("5.3").style.display = "none";
}

function myFunction5F_kidolgozott() {
    set_divContent("middle_cim", "V./ Kidolgozott példák: ");
    display_only("5fejezet");
    document.getElementById("5.2").style.display = "block";
    document.getElementById("5.1").style.display = "none";
    document.getElementById("5.3").style.display = "none";
}

function myFunction5F_feladatok() {
    set_divContent("middle_cim", "V./ Feladatok: ");
    display_only("5fejezet");
    document.getElementById("5.3").style.display = "block";
    document.getElementById("5.1").style.display = "none";
    document.getElementById("5.2").style.display = "none";
}

//functions for 6.FEJEZET BUTTONS

function myFunction6F_elmeleti() {
    set_divContent("middle_cim", "VI./ Elmélet: ");
    display_only("6fejezet");
    document.getElementById("6.1").style.display = "block";
    document.getElementById("6.2").style.display = "none";
    document.getElementById("6.3").style.display = "none";
}

function myFunction6F_kidolgozott() {
    set_divContent("middle_cim", "VI./ Kidolgozott példák: ");
    display_only("6fejezet");
    document.getElementById("6.2").style.display = "block";
    document.getElementById("6.1").style.display = "none";
    document.getElementById("6.3").style.display = "none";
}

function myFunction6F_feladatok() {
    set_divContent("middle_cim", "VI./ Feladatok: ");
    display_only("6fejezet");
    document.getElementById("6.3").style.display = "block";
    document.getElementById("6.1").style.display = "none";
    document.getElementById("6.2").style.display = "none";
}

//functions for 7.FEJEZET BUTTONS

function myFunction7F_elmeleti() {
    set_divContent("middle_cim", "VII./ Elmélet: ");
    display_only("7fejezet");
    document.getElementById("7.1").style.display = "block";
    document.getElementById("7.2").style.display = "none";
    document.getElementById("7.3").style.display = "none";
}

function myFunction7F_kidolgozott() {
    set_divContent("middle_cim", "VII./ Kidolgozott példák: ");
    display_only("7fejezet");
    document.getElementById("7.2").style.display = "block";
    document.getElementById("7.1").style.display = "none";
    document.getElementById("7.3").style.display = "none";
}

function myFunction7F_feladatok() {
    set_divContent("middle_cim", "VII./ Feladatok: ");
    display_only("7fejezet");
    document.getElementById("7.3").style.display = "block";
    document.getElementById("7.1").style.display = "none";
    document.getElementById("7.2").style.display = "none";
}

var el = document.getElementById('cim')
Typewriter(el, "Számítógépes példatár optimalizációs feladatokhoz").start();