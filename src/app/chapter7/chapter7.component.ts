import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';

@Component({
  selector: 'app-chapter7',
  templateUrl: './chapter7.component.html',
  styleUrls: ['./chapter7.component.css', '../app.component.css']
})
export class Chapter7Component implements OnInit {

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
