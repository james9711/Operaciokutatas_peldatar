import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-chapter1',
  templateUrl: './chapter1.component.html',
  styleUrls: ['./chapter1.component.css', '../app.component.css']
})
export class Chapter1Component implements OnInit {

  codes: string[] = ['Lingo', 'SAS/OR'];
  current_selected: string;
  isCodesSelected: boolean[] = [false, false];

  constructor() { }

  ngOnInit() {
  }

  onSelection(e, v) {
    console.log(e.option.selected,v); 
    this.current_selected = e.option.value;
    console.log(this.current_selected + " is choosed");

    switch(this.current_selected) {
      case this.codes[0]: {
        this.isCodesSelected[0] = !this.isCodesSelected[0];
        break;
      }
      case this.codes[1]: {
        this.isCodesSelected[1] = !this.isCodesSelected[1];
        break;
      }
    }
  }

  downloadCodes() {
    console.log(this.isCodesSelected);
    console.log("Lingo is: " + this.isCodesSelected[0]);
    console.log("SAS/OR is: " + this.isCodesSelected[1]);
    if(this.isCodesSelected[0]){
      window.location.href="../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_01.lg4";
    }
    if(this.isCodesSelected[1]){
      window.open("../../assets/sources/files/kodok/Lingo/1 fejezet feladatai/I_02.lg4");
      console.log("no file related to this task in the choose language")
    }
  }

  downloadRcode(){
    console.log("R code is opened");
    window.open("../../assets/sources/files/kodok/r/1 fejezet feladatai/I_01.R");
  }
}
