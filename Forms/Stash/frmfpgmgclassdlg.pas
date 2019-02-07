unit frmfpgmgclassDlg;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main, fpg_Button,
  tiObject, tiLog, agtiguihelper, agtidefaultdialogFPG, GMapper,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_panel, fpg_label, fpg_edit, fpg_combobox, fpg_tab
  {%endunits}
  , fpg_checkbox, fpg_Grid
  ;

type

  { TfpgMGClassDlg }

  //  1)  Create a new form in UIDesigner.
  //  2)  Save it.
  //  3)  Add agtiDialogPackFPG to project requirements.
  //  4)  Add agtiDefaultDialogFPG to Interface Uses.
  //  5)  Then change the Class derrived from to TagtiDefaultDialogFPG.
  //  6)  Add: protected procedure SetupMediator; override;
  //  7)  Overide Create(AOwner: TComponent);
  //        And Set the FDataType: TtiObject to Dialog DataType.
  //
  //    To ShowModal call Class Function Edit.
  //    To Create:
  //      A)  create(AOwner: TComponent);
  //            Then Call SetDataOnce. Then Show or ShowModal.
  //      B)  Create(AOwner: TComponent; AData: TtiObject);
  //            Then Show or ShowModal.
  //
  //    To Edit Again with uiDesigner:
  //      Change the derived class to TfpgForm.
  //      remark out override for procedure Setupmediator.
  //      open with UIDesigner and make changes.
  //      goto 2 above.
  //

  TfpgMGClassDlg = class(TagtiDefaultDialogFPG{TfpgForm})
  private
    {%region 'Auto Generated' -fold}
    {@VFD_HEAD_BEGIN: fpgMGClassDef}
    pnlButton: TfpgPanel;
    btnOK: TfpgButton;
    btnCancel: TfpgButton;
    lblBaseClassName: TfpgLabel;
    EdtBaseClassName: TfpgEdit;
    lblBaseClassParent: TfpgLabel;
    edtBaseClassParent: TfpgEdit;
    lblBaseUnitName: TfpgLabel;
    edtBaseUnitName: TfpgEdit;
    lblCrud: TfpgLabel;
    edtCrud: TfpgEdit;
    lblDefType: TfpgLabel;
    cbDefType: TfpgComboBox;
    lblOrmClassName: TfpgLabel;
    edtOrmClassName: TfpgEdit;
    pnlCheckBoxes: TfpgPanel;
    pnlCBLeft: TfpgPanel;
    pnlCBRight: TfpgPanel;
    cbAutoCreateBase: TfpgCheckBox;
    cbAutoCreateListClass: TfpgCheckBox;
    cbAutoMap: TfpgCheckBox;
    cbForwardDeclare: TfpgCheckBox;
    cbNotifyObservers: TfpgCheckBox;
    pcProperties: TfpgPageControl;
    tsPropeties: TfpgTabSheet;
    sgProperties: TfpgStringGrid;
    tsOrmMapping: TfpgTabSheet;
    Panel1: TfpgPanel;
    pnlORMLeft: TfpgPanel;
    pnlOrmRight: TfpgPanel;
    lblTableName: TfpgLabel;
    edtTableName: TfpgEdit;
    lblDatabaseFieldName: TfpgLabel;
    edtDatabsePKFieldName: TfpgEdit;
    lblOIDType: TfpgLabel;
    cbOIDType: TfpgComboBox;
    lblClassPKPropertyName: TfpgLabel;
    EdtClassPKPropertyName: TfpgEdit;
    lblPropertyMaps: TfpgLabel;
    sgPropertyMaps: TfpgStringGrid;
    tsValidators: TfpgTabSheet;
    sgValidators: TfpgStringGrid;
    tsSelections: TfpgTabSheet;
    sgSelections: TfpgStringGrid;
    {@VFD_HEAD_END: fpgMGClassDef}
    {%endregion}
  protected
    // Just add and override procedure SetupMediator for each new Dialog.
    procedure SetupMediator; override;

    //Add these to the descendant class:
    procedure btnCancelOnClick(Sender: TObject);
    procedure btnOkOnClick(Sender: TObject);
    procedure FrmOnShow(Sender: TObject); override;
    procedure FrmOnClose(Sender: TObject);

  public
    //  Override both Create:
    constructor Create(AOwner: TComponent); override;
    constructor Create(AOwner: TComponent; AData: TtiObject); override; overload;
    Destructor Destroy; override;
    procedure AfterCreate; override;

  published
    //only Set the Data Initially through this function.
    //  or call Create(AOwner, AData);
    //procedure SetDataOnce(AValue: TtiObject); virtual;

    //No need to override Edit.  If DataType is set correctly, Edit will work.
    //class function Edit(AData: TtiObject): TfpgModalResult; virtual;
    //  Must override DataType.  No need to use inherited.
    class function DataType: TtiClass; reintroduce;

  end;

procedure Log(Msg: String; aSeverity: TtiLogSeverity = lsNormal);

{@VFD_NEWFORM_DECL}

implementation

uses
  fpg_Dialogs;

type
  TzUnitName = class(TObject);

procedure Log(Msg: String; aSeverity: TtiLogSeverity = lsNormal);
begin
  {$IFDEF UseTiLog}
  tiLog.Log(TzUnitName.UnitName + ': ' + Msg, aSeverity);
  {$ENDIF}
end;


{@VFD_NEWFORM_IMPL}

procedure TfpgMGClassDlg.AfterCreate;
const
  cProcHead = 'procedure TfpgMGClassDlg.AfterCreate';
begin
  log(cprochead);
  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: fpgMGClassDef}
  Name := 'fpgMGClassDef';
  SetPosition(560, 188, 608, 752);
  WindowTitle := 'Eidt Class Define';
  IconName := '';
  BackGroundColor := $80000001;
  Hint := '';

  pnlButton := TfpgPanel.Create(self);
  with pnlButton do
  begin
    Name := 'pnlButton';
    SetPosition(0, 0, 608, 40);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
  end;

  btnOK := TfpgButton.Create(pnlButton);
  with btnOK do
  begin
    Name := 'btnOK';
    SetPosition(8, 8, 80, 22);
    Text := 'OK';
    FontDesc := '#Label1';
    ImageName := '';
    ModalResult := mrOK;
    ParentShowHint := False;
    TabOrder := 1;
    Hint := '';
    Default := true;
    OnClick := @btnOKOnClick;
  end;

  btnCancel := TfpgButton.Create(pnlButton);
  with btnCancel do
  begin
    Name := 'btnCancel';
    SetPosition(92, 8, 80, 22);
    Text := 'Cancel';
    FontDesc := '#Label1';
    ImageName := '';
    ModalResult := mrCancel;
    ParentShowHint := False;
    TabOrder := 2;
    Hint := '';
    OnClick := @btnCancelOnClick;
  end;

  lblBaseClassName := TfpgLabel.Create(self);
  with lblBaseClassName do
  begin
    Name := 'lblBaseClassName';
    SetPosition(0, 40, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Class Name (Base Class Name)';
    Hint := '';
  end;

  EdtBaseClassName := TfpgEdit.Create(self);
  with EdtBaseClassName do
  begin
    Name := 'EdtBaseClassName';
    SetPosition(0, 54, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 3;
    Text := '';
    Hint := '';
  end;

  lblBaseClassParent := TfpgLabel.Create(self);
  with lblBaseClassParent do
  begin
    Name := 'lblBaseClassParent';
    SetPosition(0, 78, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Base (Super) Class Parent';
    Hint := '';
  end;

  edtBaseClassParent := TfpgEdit.Create(self);
  with edtBaseClassParent do
  begin
    Name := 'edtBaseClassParent';
    SetPosition(0, 92, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 5;
    Text := '';
  end;

  lblBaseUnitName := TfpgLabel.Create(self);
  with lblBaseUnitName do
  begin
    Name := 'lblBaseUnitName';
    SetPosition(0, 116, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Base Unit Name';
    Hint := '';
  end;

  edtBaseUnitName := TfpgEdit.Create(self);
  with edtBaseUnitName do
  begin
    Name := 'edtBaseUnitName';
    SetPosition(0, 130, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 7;
    Text := '';
    Hint := '';
  end;

  lblCrud := TfpgLabel.Create(self);
  with lblCrud do
  begin
    Name := 'lblCrud';
    SetPosition(0, 154, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Crud';
    Hint := '';
  end;

  edtCrud := TfpgEdit.Create(self);
  with edtCrud do
  begin
    Name := 'edtCrud';
    SetPosition(0, 168, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 9;
    Text := '';
    Hint := '';
  end;

  lblDefType := TfpgLabel.Create(self);
  with lblDefType do
  begin
    Name := 'lblDefType';
    SetPosition(0, 192, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Define Type';
    Hint := '';
  end;

  cbDefType := TfpgComboBox.Create(self);
  with cbDefType do
  begin
    Name := 'cbDefType';
    SetPosition(0, 206, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#List';
    Items.Add('dtReference');
    Items.Add('dtCreate');
    FocusItem := -1;
    ParentShowHint := False;
    TabOrder := 11;
    Hint := '';
  end;

  lblOrmClassName := TfpgLabel.Create(self);
  with lblOrmClassName do
  begin
    Name := 'lblOrmClassName';
    SetPosition(0, 230, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Orm Class Name';
    Hint := '';
  end;

  edtOrmClassName := TfpgEdit.Create(self);
  with edtOrmClassName do
  begin
    Name := 'edtOrmClassName';
    SetPosition(0, 244, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 13;
    Text := '';
    Hint := '';
  end;

  pnlCheckBoxes := TfpgPanel.Create(self);
  with pnlCheckBoxes do
  begin
    Name := 'pnlCheckBoxes';
    SetPosition(0, 268, 608, 65);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
  end;

  pnlCBLeft := TfpgPanel.Create(pnlCheckBoxes);
  with pnlCBLeft do
  begin
    Name := 'pnlCBLeft';
    SetPosition(2, 2, 280, 61);
    Align := alLeft;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
  end;

  pnlCBRight := TfpgPanel.Create(pnlCheckBoxes);
  with pnlCBRight do
  begin
    Name := 'pnlCBRight';
    SetPosition(282, 2, 324, 61);
    Align := alClient;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
  end;

  cbAutoCreateBase := TfpgCheckBox.Create(pnlCBLeft);
  with cbAutoCreateBase do
  begin
    Name := 'cbAutoCreateBase';
    SetPosition(2, 2, 276, 18);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    TabOrder := 1;
    Text := 'Auto Create Base';
    Hint := '';
  end;

  cbAutoCreateListClass := TfpgCheckBox.Create(pnlCBLeft);
  with cbAutoCreateListClass do
  begin
    Name := 'cbAutoCreateListClass';
    SetPosition(2, 20, 276, 18);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    TabOrder := 2;
    Text := 'Auto Create List Class';
    Hint := '';
  end;

  cbAutoMap := TfpgCheckBox.Create(pnlCBLeft);
  with cbAutoMap do
  begin
    Name := 'cbAutoMap';
    SetPosition(2, 38, 276, 18);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    TabOrder := 3;
    Text := 'Register Auto Map (Required for Querying)';
    Hint := '';
  end;

  cbForwardDeclare := TfpgCheckBox.Create(pnlCBRight);
  with cbForwardDeclare do
  begin
    Name := 'cbForwardDeclare';
    SetPosition(2, 2, 320, 18);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    TabOrder := 1;
    Text := 'Forward Declare';
    Hint := '';
  end;

  cbNotifyObservers := TfpgCheckBox.Create(pnlCBRight);
  with cbNotifyObservers do
  begin
    Name := 'cbNotifyObservers';
    SetPosition(2, 20, 320, 18);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    TabOrder := 2;
    Text := 'Notify Observers of Property Changes';
    Hint := '';
  end;

  pcProperties := TfpgPageControl.Create(self);
  with pcProperties do
  begin
    Name := 'pcProperties';
    SetPosition(0, 333, 608, 419);
    Align := alClient;
    ParentShowHint := False;
    TabOrder := 15;
    Hint := '';
  end;

  tsPropeties := TfpgTabSheet.Create(pcProperties);
  with tsPropeties do
  begin
    Name := 'tsPropeties';
    SetPosition(3, 24, 602, 392);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Propeties';
  end;

  sgProperties := TfpgStringGrid.Create(tsPropeties);
  with sgProperties do
  begin
    Name := 'sgProperties';
    SetPosition(0, 0, 602, 392);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    ParentShowHint := False;
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    Hint := '';
  end;

  tsOrmMapping := TfpgTabSheet.Create(pcProperties);
  with tsOrmMapping do
  begin
    Name := 'tsOrmMapping';
    SetPosition(3, 24, 602, 392);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'ORM Mapping';
  end;

  Panel1 := TfpgPanel.Create(tsOrmMapping);
  with Panel1 do
  begin
    Name := 'Panel1';
    SetPosition(0, 0, 602, 95);
    Align := alTop;
    Alignment := taLeftJustify;
    BorderStyle := bsDouble;
    FontDesc := '#Label1';
    Layout := tlTop;
    ParentShowHint := False;
    Style := bsLowered;
    Text := 'Class <--> Database';
    Hint := '';
  end;

  pnlORMLeft := TfpgPanel.Create(self);
  with pnlORMLeft do
  begin
    Name := 'pnlORMLeft';
    SetPosition(0, 333, 301, 419);
    Align := alLeft;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
  end;

  pnlOrmRight := TfpgPanel.Create(self);
  with pnlOrmRight do
  begin
    Name := 'pnlOrmRight';
    SetPosition(301, 333, 307, 419);
    Align := alClient;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
  end;

  lblTableName := TfpgLabel.Create(pnlORMLeft);
  with lblTableName do
  begin
    Name := 'lblTableName';
    SetPosition(2, 2, 297, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Table Name';
    Hint := '';
  end;

  edtTableName := TfpgEdit.Create(pnlORMLeft);
  with edtTableName do
  begin
    Name := 'edtTableName';
    SetPosition(2, 16, 297, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 2;
    Text := '';
    Hint := '';
  end;

  lblDatabaseFieldName := TfpgLabel.Create(pnlORMLeft);
  with lblDatabaseFieldName do
  begin
    Name := 'lblDatabaseFieldName';
    SetPosition(2, 40, 297, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Database PK Field Name';
    Hint := '';
  end;

  edtDatabsePKFieldName := TfpgEdit.Create(pnlORMLeft);
  with edtDatabsePKFieldName do
  begin
    Name := 'edtDatabsePKFieldName';
    SetPosition(2, 54, 297, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 4;
    Text := '';
    Hint := '';
  end;

  lblOIDType := TfpgLabel.Create(pnlOrmRight);
  with lblOIDType do
  begin
    Name := 'lblOIDType';
    SetPosition(2, 2, 303, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'OID Type';
    Hint := '';
  end;

  cbOIDType := TfpgComboBox.Create(pnlOrmRight);
  with cbOIDType do
  begin
    Name := 'cbOIDType';
    SetPosition(2, 16, 303, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#List';
    FocusItem := -1;
    ParentShowHint := False;
    TabOrder := 2;
    Hint := '';
  end;

  lblClassPKPropertyName := TfpgLabel.Create(pnlOrmRight);
  with lblClassPKPropertyName do
  begin
    Name := 'lblClassPKPropertyName';
    SetPosition(2, 40, 303, 14);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Class PK Property Name';
    Hint := '';
  end;

  EdtClassPKPropertyName := TfpgEdit.Create(pnlOrmRight);
  with EdtClassPKPropertyName do
  begin
    Name := 'EdtClassPKPropertyName';
    SetPosition(2, 54, 303, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 4;
    Text := '';
    Hint := '';
  end;

  lblPropertyMaps := TfpgLabel.Create(tsOrmMapping);
  with lblPropertyMaps do
  begin
    Name := 'lblPropertyMaps';
    SetPosition(0, 95, 602, 20);
    Align := alTop;
    FontDesc := '#GridHeader';
    ParentShowHint := False;
    Text := 'Property Maps';
    Hint := '';
  end;

  sgPropertyMaps := TfpgStringGrid.Create(tsOrmMapping);
  with sgPropertyMaps do
  begin
    Name := 'sgPropertyMaps';
    SetPosition(0, 115, 602, 277);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    ParentShowHint := False;
    RowCount := 0;
    RowSelect := False;
    TabOrder := 3;
    Hint := '';
  end;

  tsValidators := TfpgTabSheet.Create(pcProperties);
  with tsValidators do
  begin
    Name := 'tsValidators';
    SetPosition(3, 24, 602, 392);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Validators';
  end;

  sgValidators := TfpgStringGrid.Create(tsValidators);
  with sgValidators do
  begin
    Name := 'sgValidators';
    SetPosition(0, 0, 602, 392);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    ParentShowHint := False;
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    Hint := '';
  end;

  tsSelections := TfpgTabSheet.Create(pcProperties);
  with tsSelections do
  begin
    Name := 'tsSelections';
    SetPosition(3, 24, 602, 392);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Selections';
  end;

  sgSelections := TfpgStringGrid.Create(tsSelections);
  with sgSelections do
  begin
    Name := 'sgSelections';
    SetPosition(0, 0, 602, 392);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    ParentShowHint := False;
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    Hint := '';
  end;

  {@VFD_BODY_END: fpgMGClassDef}
  {%endregion}

  //FBuffer := TtiObject.Create;
  WindowPosition := wpScreenCenter;
  OnShow := @FrmOnShow;
end;

class function TfpgMGClassDlg.DataType: TtiClass;
begin
  result := TGMapClassDef;
end;

procedure TfpgMGClassDlg.SetupMediator;
const cPHD = 'procedure TfpgMGClassDlg.SetupMediator';
const cPHN = 'SetupMediator';
var
  tdata: TGMapClassDef;
begin
  Log(cPHD);
  //inherited SetupMediator;
  tData := TGMapClassDef(Data);

  //published
  //  property    AutoCreateBase: boolean read FAutoCreateBase write SetAutoCreateBase;
  //  property    AutoCreateListClass: boolean read FAutoCreateListClass write SetAutoCreateListClass;
  //  property    AutoMap: Boolean read FAutoMap write SetAutoMap;
  //  property    BaseClassName: string read FBaseClassName write SetBaseClassName;
  //  property    BaseClassParent: string read FBaseClassParent write SetBaseClassParent;
  //  property    BaseUnitName: string read FBaseUnitName write SetBaseUnitName;
  //  property    Crud: string read FCrud write SetCrud;
  //  property    DefType: TClassDefType read FDefType write SetDefType;
  //  property    ForwardDeclare: boolean read FForwardDeclare write SetForwardDeclare;
  //  property    ORMClassName: string read FORMClassName write SetORMClassName;
  //  property    NotifyObserversOfPropertyChanges: boolean read FNotifyObserversOfPropertyChanges write SetNotifyObserversOfPropertyChanges default False;

  Helper.SetupPropertyMediator(tData, 'AutoCreateBase', self.cbAutoCreateBase, 'Class');
  Helper.SetupPropertyMediator(tData, 'AutoMap', self.cbAutoMap, 'Class');
  Helper.SetupPropertyMediator(tData, 'BaseClassName', self.edtBaseClassName, 'Class');
  Helper.SetupPropertyMediator(tData, 'BaseClassParent', self.EdtBaseClassParent, 'Class');
  Helper.SetupPropertyMediator(tData, 'BaseUnitName', self.edtBaseUnitName, 'Class');
  Helper.SetupPropertyMediator(tData, 'Crud', self.edtCrud, 'Class');
  Helper.SetupPropertyMediator(tData, 'DefType', self.cbDefType, 'Class');
  Helper.SetupPropertyMediator(tData, 'ForwardDeclare', self.cbForwardDeclare, 'Class');
  Helper.SetupPropertyMediator(tData, 'ORMClassName', self.edtOrmClassName, 'Class');
  Helper.SetupPropertyMediator(tData, 'NotifyObserversOfPropertyChanges', self.cbNotifyObservers, 'Class');

  //public
  //  // Object Props
  //  property    ClassProps: TMapClassPropList read FClassProps write SetClassProps;
  //  property    ClassMapping: TClassMapping read FClassMapping;
  //  property    Selections: TClassMappingSelectList read FSelections;
  //  property    Validators: TMapValidatorList read FValidators;

  //  property    ClassProps: TMapClassPropList read FClassProps write SetClassProps;
  Helper.SetupListMediator(tData.ClassProps, TGMapClassProp, self.sgProperties, '@', 'Class.ClassProps', 'Class.ClassProps.@Selected');
  //published
  //  property    Name: string read FName write SetPropName;
  //  property    PropertyType: TMapPropType read FPropertyType write SetPropType;
  //  property    PropTypeName: string read FPropTypeName write SetPropTypeName;
  //  property    IsReadOnly: boolean read FIsReadOnly write SetIsReadOnly;
  //ClassProps.Selected:

  //  Helper.SetupPropertyMediator(TGMapClassProp, 'Name', lblClassPropertySelected, 'Class.ClassProps.Selected', 'Class.ClassProps', '@Selected', TGMapClassPropList, false);


  //  Helper.SetupListMediator(tData.ClassMapping, TGClassMapping, self.sgPropertyMaps, '@', 'Class.ClassMapping');
  //  Helper.SetupListMediator(tData.Selections,

end;

procedure TfpgMGClassDlg.btnCancelOnClick(Sender: TObject);
begin
    if (Assigned(FBuffer)) and Not(FData.Equals(FBuffer)) then
    begin
      FData.Assign(FBuffer);
      //Log(cPHN + ': Cancel Button Pressed.  Buffer Has been assigned to Data.');
    end;
end;

procedure TfpgMGClassDlg.btnOkOnClick(Sender: TObject);
begin
end;

procedure TfpgMGClassDlg.FrmOnShow(Sender: TObject);
begin
  inherited FrmOnShow(Sender);
end;

procedure TfpgMGClassDlg.FrmOnClose(Sender: TObject);
begin
end;

constructor TfpgMGClassDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TfpgMGClassDlg.Create(AOwner: TComponent; AData: TtiObject);
begin
  inherited Create(AOwner, AData);
end;

destructor TfpgMGClassDlg.Destroy;
const
  cProcHead = 'destructor TfpgMGClassDlg.Destroy';
begin
  log(cProcHead);
  inherited Destroy;
end;

end.
