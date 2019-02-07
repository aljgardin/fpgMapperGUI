unit frmfpgMGEnumDlg;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main, fpg_memo, fpg_Button, fpg_ScrollFrame,
  tiObject, tiModelMediator, GMapper, agtidefaultdialogFPG,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_panel, fpg_label, fpg_edit, fpg_grid
  {%endunits}
  ;

type

  { TfpgMGEnumDlg }

  TfpgMGEnumDlg = class(TagtiDefaultDialogFPG)
  private
    {@VFD_HEAD_BEGIN: frmfpgMGEnumDlg}

    pnlButton: TfpgPanel;
    btnOK: TfpgButton;
    btnCancel: TfpgButton;
    lblEnumName: Tfpglabel;
    edtEnumName: TfpgEdit;
    lblEnumSetName: TfpgLabel;
    edtEnumSetName: TfpgEdit;
    sgValues: TfpgStringGrid;
    {@VFD_HEAD_END: frmfpgMGEnumDlg}
  protected
    procedure SetupMediator; override;

    procedure btnCancelOnClick(Sender: TObject);
    procedure btnOkOnClick(Sender: TObject);
    procedure FrmOnShow(Sender: TObject); override;
    procedure FrmOnClose(Sender: TObject);

  public
    constructor Create(AOwner: TComponent); override;
    procedure AfterCreate; override;

    class function DataType: TtiClass; virtual;

  end;

{@VFD_NEWFORM_DECL}

implementation

{@VFD_NEWFORM_IMPL}

procedure TfpgMGEnumDlg.SetupMediator;
const cPHD = 'procedure TfpgMGEnumDlg.SetupMediator';
const cPHN = 'SetupMediator';
var
  tData: TGmapEnum;
begin
  tData := TGMapEnum(Data);

  //  TGMapEnum = class(TBaseMapObject)
  //private
  //  FEnumName: string;
  //  FEnumSetName: string;
  //  FValues: TMapEnumValueList;
  //  procedure SetEnumName(const AValue: string);
  //  procedure SetEnumSetName(const AValue: string);
  //  procedure SetValues(const AValue: TMapEnumValueList);
  //public
  //  constructor Create; override;
  //  destructor  Destroy; override;
  //  property    Values: TMapEnumValueList read FValues write SetValues;
  //published
  //  property    EnumSetName: String read FEnumSetName write SetEnumSetName;
  //  property    EnumName: string read FEnumName write SetEnumName;
  //end;

  helper.SetupPropertyMediator(tData, 'EnumName', edtEnumName, 'Enum');
  helper.SetupPropertyMediator(tData, 'EnumSetName', edtEnumSetName, 'Enum');
  helper.SetupListMediator(tData.Values, TGMapEnumValue, sgValues, '@', 'Enum.Values', 'Enum.Values.Value');
end;

procedure TfpgMGEnumDlg.btnCancelOnClick(Sender: TObject);
begin
  if (Assigned(FBuffer)) and Not(FData.Equals(FBuffer)) then
  begin
    FData.Assign(FBuffer);
    //Log(cPHN + ': Cancel Button Pressed.  Buffer Has been assigned to Data.');
  end;
end;

procedure TfpgMGEnumDlg.btnOkOnClick(Sender: TObject);
begin

end;

procedure TfpgMGEnumDlg.FrmOnShow(Sender: TObject);
begin
  inherited FrmOnShow(Sender);
end;

procedure TfpgMGEnumDlg.FrmOnClose(Sender: TObject);
begin

end;

constructor TfpgMGEnumDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfpgMGEnumDlg.AfterCreate;
begin
  {@VFD_BODY_BEGIN: frmfpgMGEnumDlg}

  Name := 'fpgMGEnumDialog';
  SetPosition(10, 10, 300, 250);
  WindowTitle := 'fpgMGEnumDialog';
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

  lblEnumName := Tfpglabel.Create(self);
  with lblEnumName do
  begin
    Name := 'lblEnumName';
    SetPosition(0, 100, 100, 100);
    Align := alTop;
    Text := 'Enum Name:';
    Autosize := true;
  end;

  edtEnumName := TfpgEdit.Create(self);
  with edtEnumName do
  begin
    Name := 'edtEnumName';
    SetPosition(0, 130, 100, 100);
    Align := alTop;
    Text := 'Not Assigned.';
    Autosize := true;
    TabOrder := 1;
  end;

  lblEnumSetName := TfpgLabel.Create(self);
  with lblEnumSetName do
  begin
    Name := 'lblEnumSetName';
    SetPosition(0, 140, 100, 100);
    Align := alTop;
    Text := 'Enum Set Name:';
    Autosize := true;
  end;

  edtEnumSetName := TfpgEdit.Create(self);
  with edtEnumSetName do
  begin
    Name := 'edtEnumSetName';
    SetPosition(0, 160, 100, 100);
    Align := alTop;
    Text := 'Not Assigned.';
    Autosize := true;
    TabOrder := 2;
  end;

  sgValues := TfpgStringGrid.Create(self);
  with sgValues do
  begin
    Name := 'sgValues';
    SetPosition(0, 180, 100, 100);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc  := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint      := '';
    RowCount  := 0;
    RowSelect := true;
    TabOrder  := 3;
    //OnClick   := nil;
  end;
    {@VFD_BODY_END: frmfpgMGEnumDlg}

  WindowPosition := wpScreenCenter;
end;

class function TfpgMGEnumDlg.DataType: TtiClass;
begin
  result := TGMapEnum;
end;

end.
