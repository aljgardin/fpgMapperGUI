unit agtiMessageMemo;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main, fpg_button, fpg_edit,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_panel, fpg_memo
  {%endunits}
  ;

type

  { TagtiMessageMemo }

  TagtiMessageMemo = class(TfpgForm)
  private
    FDialogTitle: String;
    FMessageTitle: String;
    FMSG: String;
    //FWordWrap: Boolean;
    {@VFD_HEAD_BEGIN: agtiMessageMemo}
    pnlButton: TfpgPanel;
    btnOK: TfpgButton;
    memMsg: TfpgMemo;
    pnlTop: TfpgPanel;
    lblTitle: TfpgEdit;
    {@VFD_HEAD_END: agtiMessageMemo}
    procedure SetDialogTitle(AValue: String);
    procedure SetMessageTitle(AValue: String);
    procedure SetMSG(AValue: String);
    //procedure SetWordWrap(AValue: Boolean);

  public
    procedure AfterCreate; override;

  published
    property DialogTitle: String read FDialogTitle write SetDialogTitle;
    property MessageTitle: String read FMessageTitle write SetMessageTitle;
    //property WordWrap: Boolean read FWordWrap write SetWordWrap;
    property MSG: String read FMSG write SetMSG;
  end;

  procedure ShowMessageMemo(MSG: String); overload;


{@VFD_NEWFORM_DECL}

implementation

procedure ShowMessageMemo(MSG: String);
var
  dlg: TagtiMessageMemo;
begin
  try
    dlg := TagtiMessageMemo.Create(nil);
    dlg.MSG := MSG;
    dlg.ShowModal;
  finally
    dlg.Free;
  end;
end;

{@VFD_NEWFORM_IMPL}

procedure TagtiMessageMemo.SetDialogTitle(AValue: String);
begin
  if FDialogTitle = AValue then Exit;
  FDialogTitle := AValue;
  Self.WindowTitle := aValue;
end;

procedure TagtiMessageMemo.SetMessageTitle(AValue: String);
begin
  if FMessageTitle = AValue then Exit;
  FMessageTitle := AValue;
  self.lblTitle.Text := aValue;
end;

procedure TagtiMessageMemo.SetMSG(AValue: String);
begin
  if FMSG = AValue then Exit;
  FMSG := AValue;
  memMSG.Text := AValue;
end;

procedure TagtiMessageMemo.AfterCreate;
begin
  {@VFD_BODY_BEGIN: agtiMessageMemo}
  Name := 'agtiMessageMemo';
  SetPosition(653, 226, 400, 400);
  WindowTitle := 'agtiMessageMemo';
  Hint := '';
  IconName := '';
  BackGroundColor := $80000001;

  pnlButton := TfpgPanel.Create(self);
  with pnlButton do
  begin
    Name := 'pnlButton';
    SetPosition(0, 220, 300, 30);
    Align := alBottom;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  btnOK := TfpgButton.Create(pnlButton);
  with btnOK do
  begin
    Name := 'btnOK';
    SetPosition(2, 2, 80, 26);
    Align := alLeft;
    Text := 'OK';
    FontDesc := '#Label1';
    Hint := '';
    ImageName := '';
    TabOrder := 1;
  end;

  memMsg := TfpgMemo.Create(self);
  with memMsg do
  begin
    Name := 'memMsg';
    SetPosition(0, 0, 300, 220);
    Align := alClient;
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 2;
  end;

  pnlTop := TfpgPanel.Create(self);
  with pnlTop do
  begin
    Name := 'pnlTop';
    SetPosition(0, 0, 300, 20);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  lblTitle := TfpgEdit.Create(pnlTop);
  with lblTitle do
  begin
    Name := 'lblTitle';
    SetPosition(2, 2, 296, 16);
    Align := alClient;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 1;
    Text := '';
  end;

  {@VFD_BODY_END: agtiMessageMemo}

  WindowPosition := wpScreenCenter;

end;


end.
