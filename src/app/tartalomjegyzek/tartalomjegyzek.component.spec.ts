import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TartalomjegyzekComponent } from './tartalomjegyzek.component';

describe('TartalomjegyzekComponent', () => {
  let component: TartalomjegyzekComponent;
  let fixture: ComponentFixture<TartalomjegyzekComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TartalomjegyzekComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TartalomjegyzekComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
