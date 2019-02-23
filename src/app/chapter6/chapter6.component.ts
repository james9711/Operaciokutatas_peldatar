import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';

@Component({
  selector: 'app-chapter6',
  templateUrl: './chapter6.component.html',
  styleUrls: ['./chapter6.component.css', '../app.component.css']
})
export class Chapter6Component implements OnInit {

  constructor(private appComp: AppComponent) { }

  ngOnInit() {
  }

  downloadFailedSnackBar(): void {
    this.appComp.basicDownloadFailedSnackBar();
  }

  downloadSuccessSnackBar(): void {
    this.appComp.basicDownloadSuccessSnackBar();
  }

}
