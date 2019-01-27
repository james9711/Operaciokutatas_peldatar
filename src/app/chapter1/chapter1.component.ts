import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-chapter1',
  templateUrl: './chapter1.component.html',
  styleUrls: ['./chapter1.component.css', '../app.component.css']
})
export class Chapter1Component implements OnInit {

  codes: string[] = ['R', 'Lingo', 'SAS/OR'];
  current_selected: string;
  selectedItemValue: any;

  constructor() { }

  ngOnInit() {
  }

  onSelection(e, v) {
    console.error(e.option.selected,v); 
    this.current_selected = e.option.value;
    console.log(this.current_selected + " is choosed");
  }

  downloadCodes() {
    console.log("");
  }
}
