import { Component, OnInit } from '@angular/core';
import { AppComponent } from '../app.component';

@Component({
  selector: 'app-chapter5',
  templateUrl: './chapter5.component.html',
  styleUrls: ['./chapter5.component.css', '../app.component.css']
})
export class Chapter5Component implements OnInit {

  constructor(private appComp: AppComponent) { }

  ngOnInit() {
  }

  downloadFailedSnackBar(): void {
    this.appComp.basicDownloadFailedSnackBar();
  }

  downloadSuccessSnackBar(): void {
    this.appComp.basicDownloadSuccessSnackBar();
  }

  //R codes
  downloadRcode5_1(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_01.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_2(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_02.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_3(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_03.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_4(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_04.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_5(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_05.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_6(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_06.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_7(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_07.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_8(){
    window.open("../../assets/sources/files/kodok/r/4 fejezet feladatai/IV_08.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_9(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_09.R");
    this.downloadSuccessSnackBar();
  }

  downloadRcode5_10(){
    window.open("../../assets/sources/files/kodok/r/5 fejezet feladatai/V_10.R");
    this.downloadSuccessSnackBar();
  }

  //Lingo codes
  downloadLingocode5_1(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.1.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_2(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.2.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_3(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.3.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_4(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.4.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_5(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.5.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_6(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.6.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_7(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.7.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_8(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.8.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_9(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.9.lg4");
    this.downloadSuccessSnackBar();
  }

  downloadLingocode5_10(){
    window.open("../../assets/sources/files/kodok/Lingo/5 fejezet feladatai/H.10.lg4");
    this.downloadSuccessSnackBar();
  }
  
  //SAS/ OR codes
  downloadSascode5_1(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.1.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_2(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.2.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_3(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.3.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_4(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.4.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_5(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.5.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_6(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.6.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_7(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.7a.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_8(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.8a.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_9(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.9.sas");
    this.downloadSuccessSnackBar();
  }

  downloadSascode5_10(){
    window.open("../../assets/sources/files/kodok/sas or/5 fejezet feladatai/H.10.sas");
    this.downloadSuccessSnackBar();
  }

}
