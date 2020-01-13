unit frmfpgmgclassDlg;

{$mode objfpc}{$H+}
{$DEFINE DEBUG}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes, fpg_base, fpg_main,
  tiObject, tiLog,
<<<<<<< HEAD
  agtiguihelper, agfpgBaseDialogEditTiopf,
=======
  agtiguihelperBase, agfpgBaseDialogEditTiopf,
>>>>>>> 41d70ac7d0b3abb99d0679d3735dc606e7404daf
  GuiMapper,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_label, fpg_edit, fpg_combobox, fpg_panel, fpg_tab,
  {%endunits}
  fpg_checkbox, fpg_Grid, fpg_splitter;

type

  { TfpgMGClassDlg }

  TfpgMGClassDlg = class(TagfpgBaseDialogEditTiopf{TfpgForm})
  private
    {%region 'Auto Generated' -fold}
    {@VFD_HEAD_BEGIN: fpgMGClassDef}
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
    splCheckBoxes: TfpgSplitter;
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
    lblOrmTop: TfpgLabel;
    pnlOrmTop: TfpgPanel;
    splOrmPanels: TfpgSplitter;
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
    procedure SetupMediators; override;

    function DataAsType: TGMapClassDef; reintroduce;

  public
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
  inherited AfterCreate;

  //log(cprochead);

  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: fpgMGClassDef}
  Name := 'fpgMGClassDef';
  SetPosition(966, 256, 568, 694);
  WindowTitle := 'Eidt Class Define';
  IconName := '';
  BackGroundColor := $80000001;
  Hint := '';

  lblBaseClassName := TfpgLabel.Create(self);
  with lblBaseClassName do
  begin
    Name := 'lblBaseClassName';
    SetPosition(0, 0, 545, 14);
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
    SetPosition(0, 14, 545, 24);
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
    SetPosition(0, 38, 545, 14);
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
    SetPosition(0, 52, 545, 24);
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
    SetPosition(0, 76, 545, 14);
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
    SetPosition(0, 90, 545, 24);
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
    SetPosition(0, 114, 545, 14);
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
    SetPosition(0, 128, 545, 24);
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
    SetPosition(0, 152, 545, 14);
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
    SetPosition(0, 166, 545, 24);
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
    SetPosition(0, 190, 545, 14);
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
    SetPosition(0, 204, 545, 24);
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
    SetPosition(0, 228, 568, 65);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
    MinWidth := 568;
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
    MinWidth := 280;
  end;

  splCheckBoxes := TfpgSplitter.Create(pnlCheckBoxes);
  with splCheckBoxes do
  begin
    Name := 'SplCheckBoxes';
    SetPosition(282, 2, 8, 61);
    Align := alLeft;
  end;

  pnlCBRight := TfpgPanel.Create(pnlCheckBoxes);
  with pnlCBRight do
  begin
    Name := 'pnlCBRight';
    SetPosition(290, 2, 280, 61);
    Align := alClient;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
    MinWidth := 280;
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
    SetPosition(2, 2, 249, 18);
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
    SetPosition(2, 20, 249, 18);
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
    SetPosition(0, 293, 545, 401);
    ActivePageIndex := 1;
    Align := alClient;
    ParentShowHint := False;
    TabOrder := 15;
    Hint := '';
  end;

  tsPropeties := TfpgTabSheet.Create(pcProperties);
  with tsPropeties do
  begin
    Name := 'tsPropeties';
    SetPosition(3, 24, 539, 374);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Propeties';
  end;

  sgProperties := TfpgStringGrid.Create(tsPropeties);
  with sgProperties do
  begin
    Name := 'sgProperties';
    SetPosition(0, 0, 539, 374);
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
    SetPosition(3, 24, 568, 374);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'ORM Mapping';
  end;

  lblOrmTop := TfpgLabel.Create(tsOrmMapping);
  with lblOrmTop do
  begin
    Name := 'lblOrmTop';
    SetPosition(0, 0, 539, 20);
    Align := alTop;
    FontDesc := '#GridHeader';
    ParentShowHint := False;
    Text := 'Class <--> Database:';
    Hint := '';
  end;

  pnlOrmTop := TfpgPanel.Create(tsOrmMapping);
  with pnlOrmTop do
  begin
    Name := 'pnlOrmTop';
    SetPosition(0, 20, 568, 95);
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

  pnlORMLeft := TfpgPanel.Create(pnlOrmTop);
  with pnlORMLeft do
  begin
    Name := 'pnlORMLeft';
    SetPosition(2, 2, 280, 91);
    Align := alLeft;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
    MinWidth := 280;
  end;

  splOrmPanels := TfpgSplitter.Create(pnlOrmTop);
  with splOrmPanels do
  begin
    Name := 'SplOrmPanels';
    SetPosition(4, 2, 8, 91);
    Align := alLeft;
  end;

  pnlOrmRight := TfpgPanel.Create(pnlOrmTop);
  with pnlOrmRight do
  begin
    Name := 'pnlOrmRight';
    SetPosition(303, 2, 280, 91);
    Align := alClient;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := '';
    Hint := '';
    MinWidth := 280;
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
    SetPosition(2, 2, 230, 14);
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
    SetPosition(2, 16, 230, 24);
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
    SetPosition(2, 40, 230, 14);
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
    SetPosition(2, 54, 230, 24);
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
    SetPosition(0, 115, 539, 20);
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
    SetPosition(0, 135, 539, 239);
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
    SetPosition(3, 24, 539, 374);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Validators';
  end;

  sgValidators := TfpgStringGrid.Create(tsValidators);
  with sgValidators do
  begin
    Name := 'sgValidators';
    SetPosition(0, 0, 539, 374);
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
    SetPosition(3, 24, 847, 791);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Selections';
  end;

  sgSelections := TfpgStringGrid.Create(tsSelections);
  with sgSelections do
  begin
    Name := 'sgSelections';
    SetPosition(0, 0, 847, 791);
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

end;

class function TfpgMGClassDlg.DataType: TtiClass;
begin
  result := TGMapClassDef;
end;

procedure TfpgMGClassDlg.SetupMediators;
const cPHD = 'procedure TfpgMGClassDlg.SetupMediator';
const cPHN = 'SetupMediator';

var
  zData: TGMapClassDef;

begin
  Log(cPHD);
  //inherited SetupMediator;

  zData := TGMapClassDef(FData);

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

  FHelper.SetupPropertyMediator(DataAsType, 'AutoCreateBase', self.cbAutoCreateBase, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'AutoMap', self.cbAutoMap, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'BaseClassName', self.edtBaseClassName, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'BaseClassParent', self.EdtBaseClassParent, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'BaseUnitName', self.edtBaseUnitName, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'Crud', self.edtCrud, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'DefType', self.cbDefType, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'ForwardDeclare', self.cbForwardDeclare, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'ORMClassName', self.edtOrmClassName, 'Class');
  FHelper.SetupPropertyMediator(DataAsType, 'NotifyObserversOfPropertyChanges', self.cbNotifyObservers, 'Class');

  //public
  //  // Object Props
  //  property    ClassProps: TMapClassPropList read FClassProps write SetClassProps;
  //  property    ClassMapping: TClassMapping read FClassMapping;
  //  property    Selections: TClassMappingSelectList read FSelections;
  //  property    Validators: TMapValidatorList read FValidators;

  //  property    ClassProps: TMapClassPropList read FClassProps write SetClassProps;
  FHelper.SetupListMediator(DataAsType.ClassProps, TGMapClassProp, sgProperties, '@', 'Class.ClassProps', 'Class.ClassProps.@Selected');

  //  property    ClassMapping: TClassMapping read FClassMapping;
  //published
    //property    TableName: string read FTableName write SetTableName;
    //property    PKName: string read FPKName write SetPKName;
    //property    PKField: string read FPKField write SetPKField;
    //property    OIDType: TOIDType read FOIDType write SetOIDType;
    ////Object Properties:
    //property    PropMappings: TgPropMappingList read FPropMappings;
  FHelper.SetupPropertyMediator(DataAsType.ClassMapping, 'TableName', self.edtTableName, 'ClassMapping');
  FHelper.SetupPropertyMediator(DataAsType.ClassMapping, 'PKName', Self.edtDatabsePKFieldName, 'ClassMapping');
  FHelper.SetupPropertyMediator(DataAsType.ClassMapping, 'PKField', self.edtDatabsePKFieldName, 'ClassMapping');
  FHelper.SetupPropertyMediator(DataAsType.ClassMapping, 'OIDType', self.cbOIDType, 'ClassMapping');
  FHelper.SetupListMediator(DataAsType.ClassMapping.PropMappings, TGPropMapping, self.sgPropertyMaps, '@', 'ClassMapping.PropMappings', 'ClassMapping.PropMappings.@Selected');

  //  property    Selections: TClassMappingSelectList read FSelections;
  FHelper.SetupListMediator(DataAsType.Selections, TGClassMappingSelect, sgSelections, '@', 'Class.Selections', 'Class.Selections.@Selected');

  //  property    Validators: TMapValidatorList read FValidators;
  FHelper.SetupListMediator(DataAsType.Validators, TGMapValidator, sgValidators, '@', 'Class.Validators', 'Class.Validators.@Selected');
end;

function TfpgMGClassDlg.DataAsType: TGMapClassDef;
begin
  Assert(DataType.ClassName = result.ClassName, 'Error!.  DataType and DataTyped ClassNames do not match.');
  result := FData as TGMapClassDef;
end;

end.
