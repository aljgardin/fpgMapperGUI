unit frmTester3;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main, frmTester2,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_button
  {%endunits}
  ;

type

  { TTester3 }

  TTester3 = class(TTester2)
  private
    {@VFD_HEAD_BEGIN: Tester3}
    btnTester3OK: TfpgButton;
    btnAncestorOK: TfpgButton;
    {@VFD_HEAD_END: Tester3}
  public
    procedure AfterCreate; override;

    procedure Tester3OKClick(Sender: TObject);
  end;

{@VFD_NEWFORM_DECL}

implementation

uses
  fpg_Dialogs;

{@VFD_NEWFORM_IMPL}

procedure TTester3.AfterCreate;
begin
  inherited AfterCreate;

  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: Tester3}
  Name := 'Tester3';
  SetPosition(628, 252, 300, 250);
  WindowTitle := 'Tester3';
  IconName := '';
  BackGroundColor := $80000001;

  btnTester3OK := TfpgButton.Create(self);
  with btnTester3OK do
  begin
    Name := 'btnTester3OK';
    SetPosition(20, 144, 80, 24);
    Text := 'Tester 3 OK';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 1;
    OnClick := @Tester3OKClick;
  end;

  btnAncestorOK := TfpgButton.Create(self);
  with btnAncestorOK do
  begin
    Name := 'btnAncestorOK';
    SetPosition(20, 176, 216, 24);
    Text := 'Tester3 Ancestor OK';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 2;
    OnClick := @btnOKClick;
  end;

  {@VFD_BODY_END: Tester3}
  {%endregion}
end;

procedure TTester3.Tester3OKClick(Sender: TObject);
begin
  ShowMessage(SenderStr(Sender) + ': OKClick in TTester3.');
  Close;
end;


end.
