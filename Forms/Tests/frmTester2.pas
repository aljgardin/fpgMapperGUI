unit frmTester2;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_button
  {%endunits}
  ;

type

  { TTester2 }

  TTester2 = class(TfpgForm)
  private
    {@VFD_HEAD_BEGIN: Tester2}
    btnCancel: TfpgButton;
    btnOK: TfpgButton;
    {@VFD_HEAD_END: Tester2}
  public
    procedure AfterCreate; override;

    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

    function SenderStr(Sender: TObject): String;
  end;


{@VFD_NEWFORM_DECL}

implementation

uses
  fpg_Dialogs;

{@VFD_NEWFORM_IMPL}

procedure TTester2.AfterCreate;
begin
  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: Tester2}
  Name := 'Tester2';
  SetPosition(991, 329, 300, 250);
  WindowTitle := 'Tester2';
  IconName := '';
  BackGroundColor := $80000001;

  btnCancel := TfpgButton.Create(self);
  with btnCancel do
  begin
    Name := 'btnCancel';
    SetPosition(40, 88, 80, 24);
    Text := 'Cancel';
    FontDesc := '#Label1';
    ImageName := '';
    ModalResult := mrCancel;
    ParentShowHint := False;
    TabOrder := 1;
    Hint := '';
    OnClick := @btnCancelClick;
  end;

  btnOK := TfpgButton.Create(self);
  with btnOK do
  begin
    Name := 'btnOK';
    SetPosition(36, 48, 80, 24);
    Text := 'OK';
    FontDesc := '#Label1';
    ImageName := '';
    ModalResult := mrOK;
    ParentShowHint := False;
    TabOrder := 2;
    default := true;
    OnClick := @btnOKClick;
  end;

  {@VFD_BODY_END: Tester2}
  {%endregion}


end;

procedure TTester2.btnOKClick(Sender: TObject);
begin
  ShowMessage(SenderStr(Sender) + ': OK Click in TTester2');
  Close;
end;

procedure TTester2.btnCancelClick(Sender: TObject);
begin
  ShowMessage(SenderStr(Sender) + ': Cancel Click in TTester2.');
  Close;
end;

function TTester2.SenderStr(Sender: TObject): String;
var
  comp: TComponent;
  compname: String;
begin
  compName := 'Obj';
  if Sender.InheritsFrom(TComponent) then
    compName := TComponent(Sender).Name;
  result := 'Sender: ' + Sender.ClassName + ': Name = ' + compName;
end;

end.
