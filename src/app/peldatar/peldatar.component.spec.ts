import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PeldatarComponent } from './peldatar.component';

describe('PeldatarComponent', () => {
  let component: PeldatarComponent;
  let fixture: ComponentFixture<PeldatarComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PeldatarComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PeldatarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
