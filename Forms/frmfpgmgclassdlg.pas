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
  fpg_form, fpg_panel, fpg_label, fpg_edit, fpg_combobox, fpg_tab, fpg_CheckBox,
  fpg_Grid
  {%endunits}
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
    pnlOrmTop: TfpgPanel;
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

  public
    //  Override this:
    constructor Create(AOwner: TComponent); override;
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
  SetPosition(327, 80, 608, 752);
  WindowTitle := 'Eidt Class Define';
  Hint := '';
  IconName := '';
  ShowHint := True;
  BackGroundColor := $80000001;

  pnlButton := TfpgPanel.Create(self);
  with pnlButton do
  begin
    Name := 'pnlButton';
    SetPosition(0, 712, 608, 40);
    Align := alTop;
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
    OnClick := @btnOKOnClick;
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

  lblBaseClassName := TfpgLabel.Create(self);
  with lblBaseClassName do
  begin
    Name := 'lblBaseClassName';
    SetPosition(0, 0, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Class Name (Base Class Name)';
  end;

  EdtBaseClassName := TfpgEdit.Create(self);
  with EdtBaseClassName do
  begin
    Name := 'EdtBaseClassName';
    SetPosition(0, 14, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 3;
    Text := '';
  end;

  lblBaseClassParent := TfpgLabel.Create(self);
  with lblBaseClassParent do
  begin
    Name := 'lblBaseClassParent';
    SetPosition(0, 38, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Base (Super) Class Parent';
  end;

  edtBaseClassParent := TfpgEdit.Create(self);
  with edtBaseClassParent do
  begin
    Name := 'Edit1';
    SetPosition(0, 52, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 5;
    Text := '';
  end;

  lblBaseUnitName := TfpgLabel.Create(self);
  with lblBaseUnitName do
  begin
    Name := 'lblBaseUnitName';
    SetPosition(0, 76, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Base Unit Name';
  end;

  edtBaseUnitName := TfpgEdit.Create(self);
  with edtBaseUnitName do
  begin
    Name := 'edtBaseUnitName';
    SetPosition(0, 90, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 7;
    Text := '';
  end;

  lblCrud := TfpgLabel.Create(self);
  with lblCrud do
  begin
    Name := 'lblCrud';
    SetPosition(0, 114, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Crud';
  end;

  edtCrud := TfpgEdit.Create(self);
  with edtCrud do
  begin
    Name := 'edtCrud';
    SetPosition(0, 128, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 9;
    Text := '';
  end;

  lblDefType := TfpgLabel.Create(self);
  with lblDefType do
  begin
    Name := 'lblDefType';
    SetPosition(0, 152, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Define Type';
  end;

  cbDefType := TfpgComboBox.Create(self);
  with cbDefType do
  begin
    Name := 'cbDefType';
    SetPosition(0, 166, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#List';
    Hint := '';
    Items.Add('dtReference');
    Items.Add('dtCreate');
    FocusItem := -1;
    TabOrder := 11;
  end;

  lblOrmClassName := TfpgLabel.Create(self);
  with lblOrmClassName do
  begin
    Name := 'lblOrmClassName';
    SetPosition(0, 190, 608, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Orm Class Name';
  end;

  edtOrmClassName := TfpgEdit.Create(self);
  with edtOrmClassName do
  begin
    Name := 'edtOrmClassName';
    SetPosition(0, 204, 608, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 13;
    Text := '';
  end;

  pnlCheckBoxes := TfpgPanel.Create(self);
  with pnlCheckBoxes do
  begin
    Name := 'pnlCheckBoxes';
    SetPosition(0, 228, 608, 65);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  pnlCBLeft := TfpgPanel.Create(pnlCheckBoxes);
  with pnlCBLeft do
  begin
    Name := 'pnlCBLeft';
    SetPosition(2, 2, 280, 61);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  pnlCBRight := TfpgPanel.Create(pnlCheckBoxes);
  with pnlCBRight do
  begin
    Name := 'pnlCBRight';
    SetPosition(282, 2, 324, 61);
    Align := alClient;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  cbAutoCreateBase := TfpgCheckBox.Create(pnlCBLeft);
  with cbAutoCreateBase do
  begin
    Name := 'cbAutoCreateBase';
    SetPosition(2, 2, 276, 18);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    TabOrder := 1;
    Text := 'Auto Create Base';
  end;

  cbAutoCreateListClass := TfpgCheckBox.Create(pnlCBLeft);
  with cbAutoCreateListClass do
  begin
    Name := 'cbAutoCreateListClass';
    SetPosition(2, 20, 276, 18);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    TabOrder := 2;
    Text := 'Auto Create List Class';
  end;

  cbAutoMap := TfpgCheckBox.Create(pnlCBLeft);
  with cbAutoMap do
  begin
    Name := 'cbAutoMap';
    SetPosition(2, 38, 276, 18);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    TabOrder := 3;
    Text := 'Register Auto Map (Required for Querying)';
  end;

  cbForwardDeclare := TfpgCheckBox.Create(pnlCBRight);
  with cbForwardDeclare do
  begin
    Name := 'cbForwardDeclare';
    SetPosition(2, 2, 320, 18);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    TabOrder := 1;
    Text := 'Forward Declare';
  end;

  cbNotifyObservers := TfpgCheckBox.Create(pnlCBRight);
  with cbNotifyObservers do
  begin
    Name := 'cbNotifyObservers';
    SetPosition(2, 20, 320, 18);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    TabOrder := 2;
    Text := 'Notify Observers of Property Changes';
  end;

  pcProperties := TfpgPageControl.Create(self);
  with pcProperties do
  begin
    Name := 'pcProperties';
    SetPosition(0, 293, 608, 419);
    ActivePageIndex := 3;
    Align := alClient;
    Hint := '';
    TabOrder := 15;
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
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
  end;

  tsOrmMapping := TfpgTabSheet.Create(pcProperties);
  with tsOrmMapping do
  begin
    Name := 'tsOrmMapping';
    SetPosition(3, 24, 602, 392);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'ORM Mapping';
  end;

  pnlOrmTop := TfpgPanel.Create(tsOrmMapping);
  with pnlOrmTop do
  begin
    Name := 'Panel1';
    SetPosition(0, 0, 602, 95);
    Align := alTop;
    Alignment := taLeftJustify;
    BorderStyle := bsDouble;
    FontDesc := '#Label1';
    Hint := '';
    Layout := tlTop;
    Style := bsLowered;
    Text := 'Class <--> Database';
  end;

  pnlORMLeft := TfpgPanel.Create(pnlOrmTop);
  with pnlORMLeft do
  begin
    Name := 'pnlORMLeft';
    SetPosition(2, 2, 301, 91);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  pnlOrmRight := TfpgPanel.Create(pnlOrmTop);
  with pnlOrmRight do
  begin
    Name := 'pnlOrmRight';
    SetPosition(303, 2, 297, 91);
    Align := alClient;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  lblTableName := TfpgLabel.Create(pnlORMLeft);
  with lblTableName do
  begin
    Name := 'lblTableName';
    SetPosition(2, 2, 297, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Table Name';
  end;

  edtTableName := TfpgEdit.Create(pnlORMLeft);
  with edtTableName do
  begin
    Name := 'edtTableName';
    SetPosition(2, 16, 297, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 2;
    Text := '';
  end;

  lblDatabaseFieldName := TfpgLabel.Create(pnlORMLeft);
  with lblDatabaseFieldName do
  begin
    Name := 'lblDatabaseFieldName';
    SetPosition(2, 40, 297, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Database PK Field Name';
  end;

  edtDatabsePKFieldName := TfpgEdit.Create(pnlORMLeft);
  with edtDatabsePKFieldName do
  begin
    Name := 'edtDatabsePKFieldName';
    SetPosition(2, 54, 297, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 4;
    Text := '';
  end;

  lblOIDType := TfpgLabel.Create(pnlOrmRight);
  with lblOIDType do
  begin
    Name := 'lblOIDType';
    SetPosition(2, 2, 293, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'OID Type';
  end;

  cbOIDType := TfpgComboBox.Create(pnlOrmRight);
  with cbOIDType do
  begin
    Name := 'cbOIDType';
    SetPosition(2, 16, 293, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#List';
    Hint := '';
    FocusItem := -1;
    TabOrder := 2;
  end;

  lblClassPKPropertyName := TfpgLabel.Create(pnlOrmRight);
  with lblClassPKPropertyName do
  begin
    Name := 'lblClassPKPropertyName';
    SetPosition(2, 40, 293, 14);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Class PK Property Name';
  end;

  EdtClassPKPropertyName := TfpgEdit.Create(pnlOrmRight);
  with EdtClassPKPropertyName do
  begin
    Name := 'EdtClassPKPropertyName';
    SetPosition(2, 54, 293, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 4;
    Text := '';
  end;

  lblPropertyMaps := TfpgLabel.Create(tsOrmMapping);
  with lblPropertyMaps do
  begin
    Name := 'lblPropertyMaps';
    SetPosition(0, 95, 602, 20);
    Align := alTop;
    FontDesc := '#GridHeader';
    Hint := '';
    Text := 'Property Maps';
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
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 3;
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
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
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
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
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
  inherited SetupMediator;
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

constructor TfpgMGClassDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TfpgMGClassDlg.Destroy;
const
  cProcHead = 'destructor TfpgMGClassDlg.Destroy';
begin
  log(cProcHead);
  inherited Destroy;
end;

end.
