import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-chapter1',
  templateUrl: './chapter1.component.html',
  styleUrls: ['./chapter1.component.css', '../app.component.css']
})
export class Chapter1Component implements OnInit {

  codes: string[] = ['R', 'Lingo', 'SAS/OR'];
  current_selected: string;
  isCodesSelected: boolean[] = [false, false, false];

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
      case this.codes[2]: {
        this.isCodesSelected[2] = !this.isCodesSelected[2];
        break;
      }
    }

  }

  downloadCodes() {
    console.log(this.isCodesSelected);
    console.log("R is: " + this.isCodesSelected[0]);
    console.log("Lingo is: " + this.isCodesSelected[1]);
    console.log("SAS/OR is: " + this.isCodesSelected[2]);
  }
}
