import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-chapter1',
  templateUrl: './chapter1.component.html',
  styleUrls: ['./chapter1.component.css', '../app.component.css']
})
export class Chapter1Component implements OnInit {

  constructor() { }

  ngOnInit() {
  }

  downloadRcode(){
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_01.R");
    console.log("file downloaded");
  }

  downloadLingocode(){
    window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_01.lg4");
    console.log("file downloaded");
  }

  downloadSascode(){
    console.log("no file found");
    //window.open("");
  }

}
