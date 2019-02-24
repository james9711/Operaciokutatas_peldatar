import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';

@Component({
  selector: 'app-chapter3',
  templateUrl: './chapter3.component.html',
  styleUrls: ['./chapter3.component.css', '../app.component.css']
})
export class Chapter3Component implements OnInit {

  constructor(private appComp: AppComponent) { }

  ngOnInit() {
  }

  downloadFailedSnackBar(): void {
    this.appComp.basicDownloadFailedSnackBar();
  }

  downloadSuccessSnackBar(): void {
    this.appComp.basicDownloadSuccessSnackBar();
  }

  downloadSolutionForTask4() {
    window.open("../../assets/sources/files/ch3_megoldott.pdf");
    this.appComp.basicDownloadSuccessSnackBar();
  }

}
