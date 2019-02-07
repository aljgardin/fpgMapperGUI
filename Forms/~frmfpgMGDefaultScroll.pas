unit frmfpgMGDefaultDialog;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main, fpg_memo, fpg_Button, fpg_ScrollFrame,
  tiObject, tiModelMediator,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_panel
  {%endunits}
  ;

type

  { TfpgMGDefaultDialog }

  TfpgMGDefaultDialog = class(TfpgForm)
  private
    FData: TtiObject;
    FMediator: TtiModelMediator;
    {@VFD_HEAD_BEGIN: fpgMGDefaultDialog}
    pnlButton: TfpgPanel;
    btnOK: TfpgButton;
    btnCancel: TfpgButton;
    {@VFD_HEAD_END: fpgMGDefaultDialog}
  protected
    FBuffer: TtiObject;
    procedure SetupMediator; virtual;

    procedure btnCancelOnClick(Sender: TObject);

  public
    Destructor Destroy; override;
    procedure AfterCreate; override;

    property Data: TtiObject read FData write SetData;

    //class function Edit(aData: TtiObject): TfpgModalResult; virtual;
  end;

  function Edit(aData: TtiObject): TfpgModalResult;

{@VFD_NEWFORM_DECL}

implementation

uses
  tiLog,
  typinfo;

function Edit(aData: TtiObject): TfpgModalResult;
const
  cProcHead = 'function Edit(aData:TtiObject):TfpgModalResult';
var
  dlg: TfpgMGDefaultDialog;
begin
  log(cProcHead);
  result := mrCancel;
  Assert((aData <> nil) and Assigned(aData), cProchead + 'aData can not be nil and must be Assigned.');
  try
    dlg := TfpgMGDefaultDialog.Create(nil);
    log(':: Dialog Created.');
    dlg.Data := aData;
    log(':: Dialog Data is set.');
    result := dlg.ShowModal;
    log(':: Dialog ShowModal, result := ' + IntToStr(Integer(Result)));
  finally
    dlg.Free;
    log(':: Dialog Freed.');
  end;
end;

{@VFD_NEWFORM_IMPL}

procedure TfpgMGDefaultDialog.SetData(AValue: TtiObject);
const
  cProcHead = 'procedure TfpgMGDefaultDialog.SetData(AValue:TtiObject)';
begin
  { TODO : Check if Data was already set before? }

  log(cProcHead);

  if FData = AValue then
  begin
    log(':: aValue: TtiObject = FData: TtiObject, No change.');
    Exit;
  end;
  //if not(IsDataType(AValue)) then
  //begin
  //  Exception.Create('SetData(AValue: TtiObject), AValue is not of type ' + GetDataTypeName + '!');
  //  Exit;
  //end;

  FData := AValue;
  log(':: FData: TtiObject, Value Set');

  FBuffer.Assign(FData);
  log(':: Data Buffer Assigned.');

  SetupMediator;
end;

procedure TfpgMGDefaultDialog.SetupMediator;
const
  cProcHead = 'procedure TfpgMGDefaultDialog.SetupMediator';
begin
  log(cProcHead);
  if Assigned(FMediator) then
  begin
    FMediator.Active := false;
    log(':: FMediator Assigned, Set to Active = false.');
  end;

  if Not(Assigned(FMediator)) then
  begin
    FMediator := TtiModelMediator.Create(self);
    log('FMediator: TtiModelMediator, Created.');

    {*************************************************************************}
    //Add Properties Here:
  end;

  try
    FMediator.Subject := FData;
  except
    Exception.Create('Error Setting Subject of FMediator.');
    log(':: Error Setting Subject of FMediator.');
    exit;
  end;

  try
    FMediator.Active := true;
  Except
    Exception.Create('Error Activating Mediator!');
    log(':: Error Setting FMediator to Active.');
    exit;
  end;
end;

procedure TfpgMGDefaultDialog.btnCancelOnClick(Sender: TObject);
const
  cProcHead = 'procedure TfpgMGDefaultDialog.btnCancelOnClick(Sender:TObject)';
begin
  log(cProcHead);
  if Not(FData.Equals(FBuffer)) then
  begin
    FData.Assign(FBuffer);
    log(':: Cancel Button Pressed.  Buffer being assigned to Data.');
    Exit;
  end;
end;

destructor TfpgMGDefaultDialog.Destroy;
const
  cProcHead = 'destructor TfpgMGDefaultDialog.Destroy';
begin
  log(cProcHead);
  FBuffer.Free;

  inherited Destroy;
end;

procedure TfpgMGDefaultDialog.AfterCreate;
const
  cProcHead = 'procedure TfpgMGDefaultDialog.AfterCreate';
begin
  log(cProcHead);
  {@VFD_BODY_BEGIN: fpgMGDefaultDialog}
  Name := 'fpgMGDefaultDialog';
  SetPosition(629, 246, 300, 250);
  WindowTitle := 'fpgMGDefaultDialog';
  Hint := '';
  IconName := '';
  BackGroundColor := $80000001;

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
  end;

  {@VFD_BODY_END: fpgMGDefaultDialog}

  FBuffer := TtiObject.Create;
  WindowPosition := wpScreenCenter;
end;

//class function TfpgMGDefaultDialog.Edit(aData: TtiObject): TfpgModalResult;
//const
//  cProcHead = 'class function TfpgMGDefaultDialog.Edit(aData:TtiObject):ModalResult';
//var
//  dlg: TfpgMGDefaultDialog;
//begin
//  log(cProcHead);
//  result := mrCancel;
//  Assert((aData <> nil) and Assigned(aData), cProchead + 'aData can not be nil and must be Assigned.');
//  try
//    dlg := TfpgMGDefaultDialog.Create(nil);
//    log(':: Dialog Created.');
//    dlg.Data := aData;
//    log(':: Dialog Data is set.');
//    result := dlg.ShowModal;
//    log(':: Dialog ShowModal, result := ' + IntToStr(Integer(Result)));
//  finally
//  dlg.Free;
//  log(':: Dialog Freed.');
//  end;
//end;

end.
