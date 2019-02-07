unit frmfpgMGIncludesDlg;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main, fpg_memo, fpg_Button, fpg_ScrollFrame,
  tiObject, tiModelMediator, fpg_editbtn, fpg_label,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_panel
  {%endunits}
  ;

type

  { TfpgMGIncludesDlg }

  TfpgMGIncludesDlg = class(TfpgForm)
  private
    FData: TtiObject;
    FMediator: TtiModelMediator;
    {@VFD_HEAD_BEGIN: fpgMGIncludesDialog}
    //pnlMain: TfpgPanel;
    pnlButton: TfpgPanel;
    btnOK: TfpgButton;
    btnCancel: TfpgButton;
    //sfMain: TfpgScrollFrame;
    lblInclude: TfpgLabel;
    fneInclude: TfpgFileNameEdit;
    procedure SetData(AValue: TtiObject);
    {@VFD_HEAD_END: fpgMGIncludesDialog}
  protected
    FBuffer: TtiObject;
    procedure SetupMediator; virtual;

    procedure btnCancelOnClick(Sender: TObject);

  public
    Destructor Destroy; override;
    procedure AfterCreate; override;

    property Data: TtiObject read FData write SetData;
  end;

{@VFD_NEWFORM_DECL}

implementation

{@VFD_NEWFORM_IMPL}

procedure TfpgMGIncludesDlg.SetData(AValue: TtiObject);
begin
  if FData = AValue then Exit;

  FData := AValue;

  FBuffer.Assign(FData);

  SetupMediator;
end;

procedure TfpgMGIncludesDlg.SetupMediator;
begin
  //if Assigned(FMediator) then
  //begin
  //  FMediator.Active := false;
  //end;
  //
  //if Not(Assinged(FMediator)) then
  //begin
  //  FMediator := TtiModelMediator.Create(self);
  //  //Add Properties Here:
  //end;
  //
  //try
  //  FMediator.Subject := FData;
  //except
  //  Exception.Create('Error Setting Subject of mediator.');
  //  exit;
  //end;
  //
  //try
  //  FMediator.Active := true;
  //Except
  //  Exception.Create('Error Activating Mediator!');
  //end;
end;

procedure TfpgMGIncludesDlg.btnCancelOnClick(Sender: TObject);
begin
  if Not(FData.Equals(FBuffer)) then
    FData.Assign(FBuffer);
end;

destructor TfpgMGIncludesDlg.Destroy;
begin
  FBuffer.Free;

  inherited Destroy;
end;

procedure TfpgMGIncludesDlg.AfterCreate;
begin
  {@VFD_BODY_BEGIN: fpgMGIncludesDialog}
  Name := 'fpgMGIncludesDialog';
  SetPosition(629, 246, 300, 250);
  WindowTitle := 'fpgMGIncludesDialog';
  Hint := '';
  IconName := '';
  BackGroundColor := $80000001;
  WindowPosition := wpScreenCenter;

  pnlButton := TfpgPanel.Create(self);
  with pnlButton do
  begin
    Name := 'pnlButton';
    SetPosition(0, 210, 300, 40);
    Align := alBottom;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  btnOK := TfpgButton.Create(pnlButton);
  with btnOK do
  begin
    Name := 'btnOK';
    SetPosition(8, 8, 80, 22);
    Text := 'OK';
    FontDesc := '#Label1';
    Hint := '';
    ImageName := '';
    ModalResult := mrOK;
    TabOrder := 1;
    Align := alLeft;
  end;

  btnCancel := TfpgButton.Create(pnlButton);
  with btnCancel do
  begin
    Name := 'btnCancel';
    SetPosition(92, 8, 80, 22);
    Text := 'Cancel';
    FontDesc := '#Label1';
    Hint := '';
    ImageName := '';
    ModalResult := mrCancel;
    TabOrder := 2;
    OnClick := @btnCancelOnClick;
    Align := AlLeft;
  end;

  //sfMain := TfpgScrollFrame.Create(self);
  //with sfMain do
  //begin
  //  Name := 'sfMain';
  //  SetPosition(104, 64, 120, 32);
  //  Align := alClient;
  //  visible := true;
  //end;

  lblInclude := TfpgLabel.Create(self);
  with lblInclude do
  begin
    Name := 'lblInclude';
    SetPosition(0, 0, 120, 30);
    Align := AlTop;
    Autosize := true;
    Text := 'Enter Include Filename:';
  end;

  fneInclude := TfpgFileNameEdit.Create(self);
  with fneInclude do
  begin
    Name := 'fneInclude';
    SetPosition(0, 0, 120, 30);
    Align := AlTop;
    Filter := 'XML files|*.xml';
  end;
  {@VFD_BODY_END: fpgMGIncludesDialog}

  FBuffer := TtiObject.Create;
end;


end.
