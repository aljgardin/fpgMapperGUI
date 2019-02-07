unit frmFpgMapperGUIMain;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils,
  Classes,
  fpg_base,
  fpg_main,
  fpg_Widget,
  fpg_Grid,
  fpg_Menu,
  fpg_Label,
  fpg_Tab,
  fpg_Dialogs,
  fpg_constants, fpg_popupwindow,
  tiMediators,
  tiListMediators,
  tiModelMediator,
  tiObject,
  tiBaseMediator,
  tiLog,
  //tiRTTI,
  umgdatamanager, MGSubjectByMediatorName, frmfpgmgclassDlg, typinfo, {fgl,}
  GMapper, {Mapper,}
  agtiguihelper,
  agtireferenceclasses,
  agtiReferenceClassesCustom,
  agtiMessageMemo,

  tiQueryCSV,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_panel, fpg_splitter, fpg_edit, fpg_editbtn, fpg_combobox
  {%endunits}
  ;

const
  cMediatorNames: Array[1..4] of string =
    ( 'Project',
      'ProjectIncludes',
      'ProjectEnumerations',
      'ProjectIncludes'
    );

type

  { TfpgMapperGUIMainForm }

  TfpgMapperGUIMainForm = class(TfpgForm)
  private
    FData: TtiObject;
    FDeletedUnits: TGMapUnitDefList;
    FLabelPanelPad: integer;

    //  { ---Mediators:--- }
    //  { ---------------- }
    //mList: TtiModelMediatorList;
    //  { ---End Mediators.--- }

    procedure SetData(AValue: TtiObject{TGMapProject}{TtiObject});
    procedure SetLabelPanelPad(AValue: integer);

    //  { ---Mediator Procedures:--- }
    //  { -------------------------- }
    procedure RegisterMediators;
    //  { Starts the Mediator Setup Process: }
    procedure SetupMediators;
    //  { ---End Mediator Procedures.--- }

    //  { ---Event Procedures:--- }
    //  { ----------------------- }
    procedure mgOnException(Sender: TObject; E: Exception);
    procedure mgOnIdle(Sender: TObject);
    procedure mgOnKeyPress(Sender: TObject; var KeyCode: word;
      var ShiftState: TShiftState; var Consumed: boolean);
    procedure mgOnClose(Sender: TObject; var CloseAction: TCloseAction);
    //  { ---End Event Procedures.--- }

    //  { ---List Selectors Events:--- }
    //  { ---------------------------- }
    // generic On row change for Stringgrid:
    //   Use OnRowChange Instead of on click.
    //   Changes the selected Item, sets dependents.
    procedure sgOnRowChange(Sender: TObject; ARow: Integer);
    // sgOnDoubleClick Goes to edit mode of item.
    procedure sgOnDoubleClick(Sender: TObject; AButton: TMouseButton; AShift: TShiftState; const AMousePos: TPoint);


    procedure DoDependencies(aChangedSubject: TtiObject; aChangedMediatorName: String; IsListItem: Boolean);

    function GetSelectedObject(Sender: TObject): TtiObject; overload;
    function GetSelectedObject(Sender: TObject; var aSelected: TtiObject): Boolean; overload;

    //function GetView(Sender: TObject): TtiMediatorView; overload;
    //function GetView(Sender: TObject; var aView: TtiMediatorView): Boolean; overload;


    //  { Project.Units: }
    procedure sgProjectUnitsOnDoubleClick(Sender: TObject; AButton: TMouseButton;
      AShift: TShiftState; const AMousePos: TPoint);
    procedure sgProjectUnitsOnFocusChange(Sender: TObject; ARow, ACol: Integer);
    procedure sgProjectUnitsOnRowChange(Sender: TObject; ARow: Integer);

    procedure UpdateWindowTitle;

    //TfpgFocusChangeNotify = procedure(Sender: TObject; ARow, ACol: Integer) of object;
    //TfpgHeaderClick = procedure(Sender: TObject; ACol: Integer) of object;
    //TfpgRowChangeNotify = procedure(Sender: TObject; ARow: Integer) of object;

    //  { ---End List Selector Evetns.--- }

    //  { ---Other Procedures:--- }
    //  { ----------------------- }
    procedure LabelPanelResize(Sender: TObject);
    procedure ResizeLabelPanels;

    //  { ----------------------- }
    //  { ---Data Type methods--- }
    //mgData returns FData as Type TGMapProject;
    //Override This:
    function mgData: TGMapProject;
    function IsDataType(aData: TtiObject): boolean; virtual;
    //Override This:
    function GetDataType: TClass; virtual;
    function GetDataTypeName: String;
    //  { ---End Other Procedures.--- }

    //  { ---Properties, Private:--- }
    //  { -------------------------- }
    property Data: TtiObject{TGMapProject}{TtiObject} read FData write SetData;
    //  { ---End Properties, Private.--- }

    //  { ---Menu Item Event Procedures:--- }
    //  { --------------------------------- }
    //  { fpGUI Menu: File Sub Menu: template: agmfe}
    procedure miFileNew(Sender: TObject);
    procedure miFileOpen(Sender: TObject);
    procedure miFileSave(Sender: TObject);
    procedure miFileSaveAs(Sender: TObject);
    procedure miFileSaveReload(Sender: TObject);
    procedure miFileQuit(Sender: TObject);
    procedure miFileRecent(Sender: TObject);
    //  { fpGUI Menu: Edit Sub Menu: Template agmee}
    procedure miEditCut(Sender: TObject);
    procedure miEditCopy(Sender: TObject);
    procedure miEditPaste(Sender: TObject);
    procedure miEditSpellCheck(Sender: TObject);
    //  { fpGUI Menu: Edit Select Sub Menu Evetns: Template agmese}
    procedure miEditSelectAll(Sender: TObject);
    procedure miEditSelectWord(Sender: TObject);
    procedure miEditSelectLine(Sender: TObject);
    //  { fpGUI Menu: View Sub Menu Events: Template agmve}
    procedure miViewFullScreen(Sender: TObject);
    procedure miViewToolBar(Sender: TObject);
    procedure miViewStatusBar(Sender: TObject);
    procedure miViewLineNumbers(Sender: TObject);
    //  { fpGUI Menu Help Sub Menu Events: Template agmhe}
    procedure miHelpHelp(Sender: TObject);
    procedure miHelpAbout(Sender: TObject);
    //  { StringGrid Units Popup Menu:}
    procedure miProjectUnitsNew(Sender: TObject);
    procedure miProjectUnitsRename(Sender: TObject);
    procedure miProjectUnitsDelete(Sender: TObject);
    procedure miProjectUnitsSort(Sender: TObject);
    //  { StringGrid ProjectEnums PopupMenu:}
    procedure miProjectEnumsNew(Sender: TObject);
    procedure miProjectEnumsEdit(Sender: TObject);
    procedure miProjectEnumsDelete(Sender: TObject);
    procedure miProjectEnumsSort(Sender: TObject);
    //  { StringGrid ProjectIncludes PopupMenu:}
    procedure miProjectIncludesNew(Sender: TObject);
    procedure miProjectIncludesEdit(Sender: TObject);
    procedure miProjectIncludesDelete(Sender: TObject);
    procedure miProjectIncludesSort(Sender: TObject);
    //  { StringGrid UnitClasses PopupMenu:}
    procedure miUnitClassesNew(Sender: TObject);
    procedure miUnitClassesEdit(Sender: TObject);
    procedure miUnitClassesDelete(Sender: TObject);
    procedure miUnitClassesSort(Sender: TObject);

    //Returns Sender as TComponent, If TFPGMenuIten Returns PopupComponent.
    function miMenuItemToComponent(Sender: TObject): TComponent;
    //Returns the MediatorView of Sender, USes miMenuItemToComponent.
    function miMenuItemToView(Sender: TObject): TtiMediatorView;
    //Returns DependentOn Selected Object, Use miMenuItemToComponent.
    function miMenuItemToDependentOnSelected(Sender: TObject): TtiObject;

    procedure miListItemClassNew(Sender: TObject);



    //  { StringGrid UnitClasses PopupMenu: End.}
    //  { --------------------------------- }
    //  { ---End Menu Item Event Procedures.--- }

  private
    {%region 'Auto Generated' -Fold}
    {@VFD_HEAD_BEGIN: fpgMapperGUIMainForm}
    mbMainMenu: TfpgMenuBar;
    PnlProjectName: TfpgPanel;
    lblProjectNameLabel: TfpgLabel;
    lblProjectName: TfpgLabel;
    PnlProjectFileName: TfpgPanel;
    lblProjectFileNameLabel: TfpgLabel;
    lblProjectFileName: TfpgLabel;
    PnlProject: TfpgPanel;
    pcProject: TfpgPageControl;
    tsProjectSettings: TfpgTabSheet;
    tsProjectUnits: TfpgTabSheet;
    sgProjectUnits: TfpgStringGrid;
    tsProjectClasses: TfpgTabSheet;
    sgProjectClasses: TfpgStringGrid;
    tsProjectEnums: TfpgTabSheet;
    sgProjectEnums: TfpgStringGrid;
    tsProjectIncludes: TfpgTabSheet;
    sgProjectIncludes: TfpgStringGrid;
    Splitter1: TfpgSplitter;
    pnlUnit: TfpgPanel;
    pnlUnitName: TfpgPanel;
    lblUnitNameLabel: TfpgLabel;
    lblProjectUnitName: TfpgLabel;
    pcUnit: TfpgPageControl;
    tsClasses: TfpgTabSheet;
    sgUnitClasses: TfpgStringGrid;
    tsUnitEnums: TfpgTabSheet;
    sgUnitEnums: TfpgStringGrid;
    tsUnitReferences: TfpgTabSheet;
    sgUnitReferences: TfpgStringGrid;
    pmFile: TfpgPopupMenu;
    pmEdit: TfpgPopupMenu;
    pmEditSelect: TfpgPopupMenu;
    pmView: TfpgPopupMenu;
    pmHelp: TfpgPopupMenu;
    pmProjectUnits: TfpgPopupMenu;
    pmProjectEnums: TfpgPopupMenu;
    pmProjectIncludes: TfpgPopupMenu;
    pmUnitClasses: TfpgPopupMenu;
    pnlProjectSettings: TfpgPanel;
    LblProjectSettingsFilename: TfpgLabel;
    fedtProjectFilename: TfpgFileNameEdit;
    lblSettingsProjectName: TfpgLabel;
    edtProjectName: TfpgEdit;
    lblProjectOrigOutDirectory: TfpgLabel;
    dedtProjectOrigOutDirectory: TfpgDirectoryEdit;
    lblProjectOutputDirectory: TfpgLabel;
    dedtProjectOutputDirectory: TfpgDirectoryEdit;
    lblProjectBaseDirectory: TfpgLabel;
    dedtBaseDirectory: TfpgDirectoryEdit;
    lblProjectTabSpaces: TfpgLabel;
    edtTabSpaces: TfpgEditInteger;
    lblProjectBeginEndTabs: TfpgLabel;
    edtProjectBeginEndTabs: TfpgEditInteger;
    lblProjectVisibilityTabs: TfpgLabel;
    edtProjectVisibilityTabs: TfpgEditInteger;
    lblProjectMaxEditorCodeWidth: TfpgLabel;
    edtMaxEditorCodeWidth: TfpgEditInteger;
    lblProjectEnumType: TfpgLabel;
    cbProjectEnumType: TfpgComboBox;
    {@VFD_HEAD_END: fpgMapperGUIMainForm}
    {%endregion}

  private
    //  { ---Tests:--- }
    procedure miHelpScrollFrame(Sender: TObject);
    procedure miHelpDefaultDialog(Sender: TObject);
    procedure miHelpIncludeDialog(Sender: TObject);
    procedure miHelpSelectFileDialog(Sender: TObject);
    procedure miHelpEnumDialog(Sender: TObject);
    procedure miHelpShowmListNames(Sender: TObject);
    procedure miHelpShowmListViews(Sender: TObject);
    procedure miHelpListClass(Sender: TObject);
    procedure miHelpUpdateUnitName(Sender: TObject);
    procedure miHelpShowSubjectClasses(Sender: TObject);
    procedure miHelpShowViews(Sender: TObject);
    procedure miHelpShowMaps(Sender: TObject);
    procedure miHelpShowClassEditDlg(Sender: TObject);
    procedure ShowmListNames;
    procedure ShowmListViews;

  public
    testClassDef: TGMapClassDef;


    GUIHelper: TagtiGUIHelper;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterCreate; override;

    procedure Log(msg: String); overload;
    procedure Log(aProcedure: String; msg: String); overload;

    //  { ---Properties, Public:--- }
    property LabelPanelPad: integer read FLabelPanelPad write SetLabelPanelPad;
  end;

Function PopupWidgetFromSender(Sender: TObject): TfpgWidget;

{@VFD_NEWFORM_DECL}

implementation

uses
  tiDialogs,
  frmfpgMGDefaultDialog,
  frmfpgMGIncludesDlg,
  frmfpgMGEnumDlg,
  mgFpgDialogs;

function PopupWidgetFromSender(Sender: TObject): TfpgWidget;
begin
  //Returns the Widget which called the popupmenu.
  Result := nil;
  if Sender is TfpgMenuItem  then
  begin
    if TfpgMenuItem(Sender).Owner is TfpgPopupMenu then
    begin
      result := TfpgPopupMenu(TfpgMenuItem(Sender).Owner).PopupComponent;
    end;
  end;
end;

{@VFD_NEWFORM_IMPL}

procedure TfpgMapperGUIMainForm.SetData(AValue: TtiObject{TGMapProject}{TtiObject});
begin
  if FData = AValue then
    Exit;

  //Type Check Data:
  if Not(IsDataType(AValue)) then
  begin
    Exception.Create('TfpgMapperGUIMainForm.SetData(AValue: TtiObject);' + #10#13 +
      'AValue not of type ' + GetDataTypeName + '!');
    Exit;
  end;

  if Not(Assigned(AValue)) then
  begin
    Exception.Create('TfpgMapperGUIMainForm.SetData(AValue: TtiObject);' + #10#13 +
      'AValue not Assigned!');
    Exit;
  end;

  if AValue = nil then
  begin
    Exception.Create('TfpgMapperGUIMainForm.SetData(AValue: TtiObject);' + #10#13 +
      'AValue cannot be nil!');
    Exit;
  end;

  FData := AValue;
  SetupMediators;
end;

procedure TfpgMapperGUIMainForm.miFileNew(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileNew(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miFileOpen(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileOpen(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miFileSave(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileSave(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miFileSaveAs(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileSaveAs(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miFileSaveReload(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileSaveReload(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miFileQuit(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileQuit(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miFileRecent(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miFileRecent(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditCut(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditCut(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditCopy(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditCopy(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditPaste(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditPaste(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditSpellCheck(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditSpellCheck(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditSelectAll(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditSelectAll(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditSelectWord(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditSelectWord(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miEditSelectLine(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miEditSelectLine(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miViewFullScreen(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miViewFullScreen(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miViewToolBar(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miViewToolBar(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miViewStatusBar(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miViewStatusBar(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miViewLineNumbers(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miViewLineNumbers(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miHelpHelp(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miHelpHelp(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miHelpAbout(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miHelpAbout(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miProjectUnitsNew(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectUnitsNew(Sender:TObject)';
var
  uName: string;
  zData: TGMapUnitDef;

  aView: TtiMediatorView;
  aDataType: TClass;
  { TODO : Use TtiObject instead.
Create Object from Object Factory. }
begin
  uName := '';
  if fpg_Dialogs.fpgInputQuery('New Unit.', 'Enter New Unit:', uName) then
  begin

    //Check for duplicate:
    if mgData.Units.NameExists(uName) then
    begin
      ShowMessage('Unit [' + uName + '] already exists!', 'Unit already Exists!');
      exit;
    end;

    zData      := TGMapUnitDef.Create;
    zData.Name := uName;
    zData.NotifyObservers();
    mgData.Units.Add(zData);
    mgData.Units.NotifyObservers();
  end;
end;

procedure TfpgMapperGUIMainForm.miProjectUnitsRename(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectUnitsRename(Sender:TObject)';
var
  uName, zName: string;
  zData: TGMapUnitDef;
  iData: TtiObject;
  aPopup: TfpgWidget;
  liType: TClass;
  amv: TtiMediatorView;
  aMediatorName: String;
begin

  //TO Automate, just need a reference to PropertyName of itemclass to use as
  //  field to use.
  //...  ie 'Name'

  //Need to send PopuComponent of Menu wich should be the String grid
  //  to GetviewselectedObject.

  if Not(Sender.InheritsFrom(TfpgMenuItem)) then
     Exit;

  aPopup := TfpgPopupMenu( TfpgMenuItem(Sender).Owner ).PopupComponent;

  // is an item selected?
  if Not(GUIHelper.GetViewSelectedObject(aPopup, iData)) then
  begin
    ShowMessage(cProcHead + ' No item Selected.');
    exit;
  end;

  if iData = nil then exit;

  //we have the item type, get the ListType.
  liType := GUIHelper.ListToItemList.FindListClassTypeByItemClassType(iData.ClassType);

  if liType = nil then exit;

  //Find the MediatorView:
  amv := GUIHelper.mList.FindMediatorView(aPopup);
  if amv = nil then exit;

  zName := iData.PropValue['Name'];
  uName := zName;

  if fpg_Dialogs.fpgInputQuery('Rename Unit.', 'Enter New Unit Name:', zName) then
  begin
    if zName = uName then exit;

    // Duplicate?
    if GUIHelper.olPropExists(aMV.Subject, 'Name', zName) then
    begin
      ShowMessage('Unit [' + zName + '] already exist!', 'Unit already Exists!');
      exit;
    end;

    iData.PropValue['Name'] := zName;
    iData.NotifyObservers();
  end;
end;

procedure TfpgMapperGUIMainForm.miProjectUnitsDelete(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectUnitsDelete(Sender:TObject)';
var
  uName: string;
  zData: TGMapUnitDef;
begin
//  { TODO : REDO
//*********************************** }
//  if Not(Sender is TComponent) then
//  begin
//    tiAppError('Unit Not Selected.  Select Unit first.');
//    Exit;
//  end;

  if not (GUIHelper.IsViewSelected(sgProjectUnits)) then
  begin
    tiAppError('Unit Not Selected.  Select Unit first.');
    Exit;
  end;

  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miProjectUnitsSort(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectUnitsSort(Sender:TObject)';
var
  frow: Integer;
  aObject: TtiObject;
  mv: TtiMediatorView;
begin
  if Not(GetSelectedObject(Sender, aObject)) Then
  Exit;

  //if not(GetView(Sender, mv)) then
  //  Exit;





  mgData.Units.SortByProps(['Name'], True);



  { TODO : After Sort:
  Focused row may not be the same item in list as before sort.
  WHAT TO DO?
 }



  { TODO : When sorting a list the selected, highlighted item does not reflect the correct item. }
end;

procedure TfpgMapperGUIMainForm.miProjectEnumsNew(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectEnumsNew(Sender:TObject)';
var
  pe: TGMapEnum;
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');

  pe := TGMapEnum.Create;

  if TfpgMGEnumDlg.Edit(pe) = Integer(mrOK) then
  begin
    mgData.ProjectEnums.Add(pe);
    mgData.ProjectEnums.NotifyObservers();
  end
  else
    pe.Free;
end;

procedure TfpgMapperGUIMainForm.miProjectEnumsEdit(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectEnumsEdit(Sender:TObject)';
var
  pe: TGMapEnum;
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');

  //if IsProjectEmnumerationSelected then
  //begin;
  //  pe := GetSelectedProjectEnumeration;
  //  if TfpgMGEnumDlg.Edit(pe) then
  //  begin
  //    pe.NotifyObservers();
  //    mgData.ProjectEnums.NotifyObservers();
  //  end;
  //end;
end;

procedure TfpgMapperGUIMainForm.miProjectEnumsDelete(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectEnumsDelete(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miProjectEnumsSort(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectEnumsSort(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miProjectIncludesNew(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectIncludesNew(Sender:TObject)';
var
  dlg: TMGFileDialogSelect;
  pi: TGMapProjectIncludeFile;
begin
  try
    dlg := TMGFileDialogSelect.Create(self);
    dlg.WindowTitle := 'Select a New Project Include File.';

    if dlg.RunSelectFile then
    begin
      pi := TGMapProjectIncludeFile.Create;
      pi.IncludeFilename := dlg.FileName;
      mgData.IncludeFiles.Add(pi);
      mgData.IncludeFiles.NotifyObservers();
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfpgMapperGUIMainForm.miProjectIncludesEdit(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectIncludesEdit(Sender:TObject)';
var
  dlg: TMGFileDialogSelect;
  pi: TGMapProjectIncludeFile;
begin

  ShowMessage(cProcHead + ' NOT COMPLETED!');
  //try
  //  pi := GetSelectedProjectIncludeFile;
  //  if pi = nil then
  //  begin
  //    tiAppError('Please select a valid IncludeFile to Edit.');
  //    Exit;
  //  end;
  //
  //  dlg := TMGFileDialogSelect.Create(self);
  //  dlg.WindowTitle := 'Select a Different Project Include File.';
  //  dlg.FileName := pi.IncludeFilename;
  //
  //  if dlg.RunSelectFile then
  //  begin
  //    pi.IncludeFilename := dlg.FileName;
  //    mgData.IncludeFiles.NotifyObservers();
  //  end;
  //finally
  //  dlg.Free;
  //end;
end;

procedure TfpgMapperGUIMainForm.miProjectIncludesDelete(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectIncludesDelete(Sender:TObject)';
var
  pi: TGMapProjectIncludeFile;
begin

  ShowMessage(cProcHead + ' NOT COMPLETED!');

  { TODO : REDO
***************************** }

  //pi := GetSelectedProjectIncludeFile;
  //if pi = nil then
  //begin
  //  tiAppError('Please select a valid IncludeFile to Edit.');
  //  Exit;
  //end;
  //
  //if tiAppConfirmation('Delete Project Include: ' + pi.IncludeFilename +
  //  ' ?', 'Delete Project Include File?') then
  //begin
  //  pi.Deleted := True;
  //  mgData.IncludeFiles.FreeDeleted;
  //  mgData.IncludeFiles.NotifyObservers();
  //  //InvalidateProjectIncludesSelection;
  //end;
end;

procedure TfpgMapperGUIMainForm.miProjectIncludesSort(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miProjectIncludesSort(Sender:TObject)';
begin
    { TODO : REDO
***************************** }

  mgData.IncludeFiles.SortByProps(['IncludeFilename'], True);
  mgData.IncludeFiles.NotifyObservers();
  //InvalidateProjectIncludesSelection;
end;

procedure TfpgMapperGUIMainForm.miUnitClassesNew(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miUnitClassesNew(Sender:TObject)';
var
  uName: string;
  zData: TGMapClassDef;
  mvClasses: TtiMediatorView;
  vtmn: TagtiViewToMediatorName;
  soUnits: TtiObject;
  lClasses: TtiObject;
  aViewComponent: TComponent;

  depOnSelected: TTiObject;
  mv: TtiMediatorView;
  newClassName: String;
  nObject, niObject: TtiObject;
  idx: Integer;
  oc: TtiClass;
begin
  log(cProcHead);
  log('::Sender.ClassName = ' + Sender.ClassName);

  // 1) Check if Unit Selected. DependentOn Selected.
  // 2) Query new class name.  What Kind of action, New Name Dialog or New Object Dialog.
  // 3) create new class.
  // 4) Add new class to unit.

  depOnSelected := miMenuItemToDependentOnSelected(Sender);
  if depOnSelected = nil then exit;
  ShowMessage('DependentOn Class: ' + depOnSelected.AsDebugString());
  //TGMapUnitDef.UnitClasses

  mv := miMenuItemToView(Sender);
  if mv = nil then
      exit;

  newClassName := mv.Subject.ClassName;

  ShowMEssage(newClassName);

  if Not(GUIHelper.tiObjectFactory.IsRegistered(newClassName)) then
  begin
    GUIHelper.tiObjectFactory.RegisterClass(newClassName, TtiClass(mv.Subject.ClassType));
  end;

  nObject := GUIHelper.tiObjectFactory.CreateNewInstance(newClassName);

  oc := GUIHelper.tiObjectFactory.ClassByName(mv.Subject.ClassName);

  ShowMessage(oc.ClassName);

  //AddnewObject to ListClass:
  idx := (depOnSelected as TGMapUnitDef).UnitClasses.Add(nObject);
  if idx = -1 then
    exit;
  niObject := (depOnSelected as TGMapUnitDef).UnitClasses.items[idx];

  ShowMessage(nObject.AsDebugString());
  ShowMessage(niObject.AsDebugString());

  //GUIHelper.tiObjectFactory.CreateInstance();
end;

function TfpgMapperGUIMainForm.miMenuItemToComponent(Sender: TObject): TComponent;
var
  pm: TfpgPopupMenu;
  pc: TComponent;
begin
  result := nil;

  if Not(Sender is TComponent) then
    exit;

  pc := TComponent(Sender);

  // returns the View of the Sender: TObject if it is a TfpgMenuItem.
  if Sender is TfpgMenuItem then
  begin
    if (Sender as TfpgMenuItem).Owner is TfpgPopupMenu then
    begin
      pm := (Sender as TfpgMenuItem).Owner as TfpgPopupMenu;
      pc := pm.PopupComponent;
    end;
  end;
  result := pc;
end;

function TfpgMapperGUIMainForm.miMenuItemToView(Sender: TObject): TtiMediatorView;
var
  pc: TComponent;
begin
  result := nil;
  pc := miMenuItemToComponent(Sender);

  if pc <> nil then
  begin
    result := GUIHelper.GetView(pc);
  end;
end;

function TfpgMapperGUIMainForm.miMenuItemToDependentOnSelected(Sender: TObject
  ): TtiObject;
var
  pc: TComponent;
//  mv: TtiMediatorView;
  aItem: TagtiViewToMediatorName;
  depOnMediatorName: String;
  SelMediatorName: String;
  idx: Integer;
  mm: TtiModelMediator;
  depOnView: TComponent;
  depOnSelectedObject: TtiObject;
  temp: String;
  mmap: TagtiMediatorMap;
  depOnPropertyName: String;
begin
  result := nil;

  if Not(Sender is TComponent) then
    exit;

  pc := miMenuItemToComponent(Sender);

  if pc = nil then exit;

  temp := pc.ClassName;

  if Not(GUIHelper.ViewToMediatorNameList.FindByView(pc, aItem)) then
    exit;

  //{$ifdef debug}ShowMessage(aItem.AsDebugString());{$endif}

  selMediatorName := aItem.MediatorName;

  //Get Dependent On Mediator Name.

  idx := GUIHelper.FindPropertyMediatorName(selMediatorName);

  //{$ifdef debug}ShowMessage('idx = ' + IntToStr(idx));{$endif}

  if idx = -1 then
    exit;

  mmap :=GUIHelper.MediatorMapList.Items[idx];
  depOnMediatorName := mmap.DependentOnMediatorName;
  depOnPropertyName := mmap.DependentOnPropertyName;

  //{$ifdef debug}showmessage('DepOnMediatorName = ' + depOnMediatorName); {$endif}

  mm := GUIHelper.mList.ModelMediator(depOnMediatorName);

  if mm = nil then
    exit;

  //{$ifdef debug}ShowMessage(mm.ClassName);{$endif}

  idx := GUIHelper.ViewToMediatorNameList.FindByMediatorName(depOnMediatorName);

  if idx = -1 then
    exit;

  depOnView := GUIHelper.ViewToMediatorNameList.Items[idx].View;

  depOnSelectedObject := nil;

  depOnSelectedObject := mm.SelectedObject[depOnView];
  depOnSelectedObject := GUIHelper.mList.SelectedObject[depOnView];
  result := depOnSelectedObject;
end;

procedure TfpgMapperGUIMainForm.miListItemClassNew(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miListItemClassNew(Sender:TObject)';
var
  mv: TtiMediatorView;

begin
  // 1) get the view of Sender:
  //    Is it a ListClass Mediator?
  //    We have the subject, what is the mediatorName?
  // 2) get the mediator name of the ListItemClass.
  // 3) is the dependent on Valid, Selected?
  // 4)  Add as InputQuery or Dialog?
  // 5)  Add the item if not canceled.

  {1}
  mv := GUIHelper.GetView(Sender);
  if mv = nil then exit;
  //is it a listclass:




end;

procedure TfpgMapperGUIMainForm.miUnitClassesEdit(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miUnitClassesEdit(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');

end;

procedure TfpgMapperGUIMainForm.miUnitClassesDelete(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miUnitClassesDelete(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miUnitClassesSort(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miUnitClassesSort(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.SetLabelPanelPad(AValue: integer);
begin
  if FLabelPanelPad = AValue then
    Exit;
  FLabelPanelPad := AValue;
end;

procedure TfpgMapperGUIMainForm.SetupMediators;
var
  cStr: String; //CompositeStr
  {$ifdef debug}
  strs: TStringlist;
  {$Endif}
begin
  { Project }
  // { TGMapProject: TMapProject }
  //Public
  //  property    Units: TMapUnitDefList read FUnits;
  //  property    ProjectClasses: TMapClassDefList read FProjectClasses write SetProjectClasses;
  //  property    ProjectEnums: TMapEnumList read FProjectEnums;
  //published
  //  property    FileName: string read FFileName write SetFileName;
  //  property    ProjectName: string read FProjectName write SetProjectName;
  //  property    Includes: TStringList read FIncludes;
  //  property    OrigOutDirectory: string read FOrigOutDirectory write SetOrigOutDirectory;
  //  property    OutputDirectory: string read FOutputDirectory write SetOutputDirectory;
  //  property    BaseDirectory: string read FBaseDirectory write SetBaseDirectory;
  //  property    TabSpaces: integer read FTabSpaces write SetTabSpaces;
  //  property    BeginEndTabs: integer read FBeginEndTabs write SetBeginEndTabs;
  //  property    VisibilityTabs: integer read FVisibilityTabs write SetVisibilityTabs;
  //  property    MaxEditorCodeWidth: integer read FMaxEditorCodeWidth write SetMaxEditorCodeWidth;
  //  property    EnumType: TEnumType read FEnumType write SetEnumType;
  //
  //  IncludeFiles: TGMapProjectIncludeFileList, a Mediator friendly object.
  //  property IncludeFiles: TGMapProjectIncludeFileList read GetIncludeFiles write SetIncludeFiles;
  //
  // Project:
  // Project.Units
  // Project.ProjectClasses
  // Project.ProjectEnums
  // Project.IncludeFiles
  //
  // Project:
  GUIHelper.SetupPropertyMediator(mgData, 'Filename', lblProjectFilename, 'Project', 'Projects', 'TGMapProjectList', 'Items', false);
  GUIHelper.SetupPropertyMediator(mgData, 'ProjectName', lblProjectName, 'Project', 'Projects', 'TGMapProjectList', 'Items', false);

  // Project.Units:
  cStr := GUIHelper.PGM.GetCompositeStrCol(TGMapUnitDefList.ClassName, 'Name', 150);
  GUIHelper.SetupListMediator(mgData.Units, TGMapUnitDef, sgProjectUnits, cstr, 'Project.Units', 'Project.Units.Selected', 'Project', 'TMGMapProject', 'Units', false);

  // Project.ProjectClasses:
  GUIHelper.SetupListMediator(mgData.ProjectClasses, TGMapClassDef, sgProjectClasses, '@', 'Project.ProjectClasses', 'Project.ProjectClasses.Selected', 'Project', 'TGMapProject', 'ProjectClasses', false);

  // Project.ProjectEnums
  GUIHelper.SetupListMediator(mgData.ProjectEnums, TGMapEnum, sgProjectEnums, '@', 'Project.ProjectEnums', 'Project.ProjectEnums.Selected', 'Project', 'TGMapProject', 'ProjectEnums', false);

  // Project.IncludeFiles:
  GUIHelper.SetupListMediator(mgData.IncludeFiles, TGMapProjectIncludeFileList, sgProjectIncludes, '@', 'Project.IncludeFiles', 'Project.IncludeFiles.Selected', 'Project', 'TGMapProject', 'IncludeFiles',true);

    {Project.Units.Selected}
    //TMapUnitDef = class(TBaseMapObject)
    //private
    //  FReferences: TStringList;
    //  FUnitClasses: TMapClassDefList;
    //  FUnitEnums: TMapEnumList;
    //  FName: string;
    //  procedure SetUnitName(const AValue: string);
    //published
    //  property    Name: string read FName write SetUnitName;
    //  // Object properties
    //  property    UnitClasses: TMapClassDefList read FUnitClasses;
    //  property    UnitEnums: TMapEnumList read FUnitEnums;
    //  property    References: TStringList read FReferences;
    //public
    //  constructor Create; override;
    //  destructor  Destroy; override;
    //  function    HasValidators: boolean;
    //end;
    //
    //TGMapUnitDef = class(TMapUnitDef)
    //public
    //   A mediator friendly References:
    //  property UnitReferences: TGMapUnitReferenceList read GetUnitReferences write SetUnitReferences;
    //
    // Project.Units.Selected
    // Project.Units.Selected.UnitClasses
    // Project.Units.Selected.UnitEnums
    // Project.Units.Selected.UnitReferences
    //
    // Project.Units.Selected:
    GUIHelper.SetupPropertyMediatorClassOf(TGMapUnitDef, 'Name', lblProjectUnitName, 'Project.Units.Selected', 'Project.Units', 'TGMapUnitDefList', 'Items', false);

    // Project.Units.Selected.UnitClasses:
    GUIHelper.SetupListMediatorClassOf(TGMapClassDefList, TGMapClassDef, sgUnitClasses, '@', 'Project.Units.Selected.UnitClasses', 'Project.Units.Selected.UnitClasses.Selected', 'Project.Units', 'TGMapUnitDef', 'Unitclasses', true);

    // Project.Units.Selected.UnitEnums:
    GUIHelper.SetupListMediatorClassOf(TGMapEnumList, TGMapEnum, sgUnitEnums, '@', 'Project.Units.Selected.UnitEnums', 'Project.Units.Selected.UnitEnums.Selected', 'Project.Units.Selected', 'TGMapUnitDef', 'ProjectEnums', true);

    // Project.Units.Selected.UnitReferences:
    GUIHelper.SetupListMediatorClassOf(TGMapUnitReferenceList, TGMapUnitReference, sgUnitReferences, '@', 'Project.Units.Selected.UnitReferences', 'Project.Units.Selected.UnitReferecnes.Selected', 'Project.Units.Selected', 'TGMapUnitDef', 'UnitReferences', true);

    {Project.ProjectClasses.Selected}

    // Project.ProjectEnums
    // Project.IncludeFiles





  {Project.ProjectEnums.Selected}
  //FProjectEnums: TMapEnumList; TMapEnum:
  //TMapEnum = class(TBaseMapObject)
  // private
  //   FEnumName: string;
  //   FEnumSetName: string;
  //   FValues: TMapEnumValueList;
  //   procedure SetEnumName(const AValue: string);
  //   procedure SetEnumSetName(const AValue: string);
  //   procedure SetValues(const AValue: TMapEnumValueList);
  // public
  //   constructor Create; override;
  //   destructor  Destroy; override;
  //   property    Values: TMapEnumValueList read FValues write SetValues;
  // published
  //   property    EnumSetName: String read FEnumSetName write SetEnumSetName;
  //   property    EnumName: string read FEnumName write SetEnumName;
  // end;
  //
  // Project.ProjectEnums:

  {Project.IncludeFiles}
  //TGMapInclude:
  //  published
  //  property    IncludeFilename: String read FIncludeFilename write SetIncludeFilename;
  //end;
//  GUIHelper.SetupListMediator(mgData.IncludeFiles, TGMapProjectIncludeFile, sgProjectIncludes, '@', 'Project.IncludeFiles');


  { Project.Units.Selected }
  //TGMapUnitDefList, Item: TGMapUnitDef: }
  { TGMapUnitDef: TMapUnitDef }
  //published
  //  property    Name: string read FName write SetUnitName;
  //  // Object properties
  //  property    UnitClasses: TMapClassDefList read FUnitClasses;
  //  property    UnitEnums: TMapEnumList read FUnitEnums;
  //  property    References: TStringList read FReferences;
  //
  //public
  //  // A mediator friendly References:
  //  property UnitReferences: TGMapUnitReferenceList read GetUnitReferences write SetUnitReferences;
  //
  // Project.Units.Selected:
  // Project.Units.Selected.UnitClasses
  // Project.Units.Selected.UnitEnums
  // Project.Units.Selected.UnitReferences
  //
  // Project.Units.Selected:

//  ShowMessageMemo(GUIHelper.MediatorMaps.AsDebugString());
//  ShowMessage{Memo}(GUIHelper.MediatorMaps.sMediatorNameSubjectProc('Test'));

  {$ifdef debug}
  strs := TStringlist.Create;
  try
    strs.Text := GUIHelper.MediatorMapList.sMediatorNameSubjectProc('zSubjectByMediatorName');
    strs.SaveToFile('zSubjectByMediatorName.txt');

    strs.Text := GUIHelper.MediatorMapList.sSubjectByMediatorNameUnit('SubjectByMediatorName', 'MGSubjectByMediatorName', 'GMapper');
    strs.SaveToFile('MGSubjectByMediatorName.txt');
  finally
    strs.Free;
  end;
  {$endif}
end;

procedure TfpgMapperGUIMainForm.RegisterMediators;
begin
  //  gMediatorManager.RegisterMediator(TtiStaticTextMediatorView, TGMapProject, 'ProjectName');
  //  gMediatorManager.RegisterMediator(TtiStaticTextMediatorView, TtiObject, 'ProjectName');
end;

procedure TfpgMapperGUIMainForm.ResizeLabelPanels;
begin
  LabelPanelResize(pnlProjectName);
  LabelPanelResize(pnlProjectFileName);
  LabelPanelResize(pnlUnitName);
end;

function TfpgMapperGUIMainForm.mgData: TGMapProject;
begin
  result := TGMapProject(FData);
end;

function TfpgMapperGUIMainForm.IsDataType(aData: TtiObject): boolean;
begin
  result := false;
  if aData = nil then
    Exit;
  if aData.ClassType = GetDataType.ClassType then
    result := true;
end;

function TfpgMapperGUIMainForm.GetDataType: TClass;
begin
  //Override This:
  result := TGMapProject;
end;

function TfpgMapperGUIMainForm.GetDataTypeName: String;
begin
  result := GetDataType.ClassName;
end;

procedure TfpgMapperGUIMainForm.LabelPanelResize(Sender: TObject);
var
  ht: integer;
  ic, cc: integer;
  aPanel: TfpgPanel;
  aComp: TComponent;
  aLabel: TfpgLabel;
begin
  if not (Assigned(Sender)) or not (Sender is TfpgPanel) then
    Exit;

  aPanel := TfpgPanel(Sender);
  cc     := aPanel.ComponentCount;
  if cc = 0 then
    exit;

  ht := 0;

  // Find the largest height Label:
  // Each should be side by side.
  for ic := 0 to (cc - 1) do
  begin
    aComp := aPanel.Components[ic];
    if aComp is TfpgLabel then
    begin
      aLabel := TfpgLabel(aComp);

      if aLabel.Font.FontRes.GetHeight > ht then
        ht := aLabel.Font.FontRes.GetHeight;
    end;  //End If is TfpgWidget
  end;  //End for ic = 0 to cc do

  if ht > 0 then
    aPanel.Height := ht + FLabelPanelPad;
end;

procedure TfpgMapperGUIMainForm.mgOnException(Sender: TObject; E: Exception);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.mgOnException(Sender:TObject;E:Exception)';
begin
  //ShowMessage(cProcHead + ' NOT COMPLETED!');
  { TODO : Add Exception Logging. }
end;

procedure TfpgMapperGUIMainForm.mgOnIdle(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.mgOnIdle(Sender:TObject)';
begin
  //ShowMessage(cProcHead + ' NOT COMPLETED!');
  { TODO : On Idle. }

  // Menus:
end;

procedure TfpgMapperGUIMainForm.mgOnKeyPress(Sender: TObject;
  var KeyCode: word; var ShiftState: TShiftState; var Consumed: boolean);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.mgOnKeyPress(Sender:TObject;KeyCode:word;ShiftState:TShiftState;Consumed:boolean)';
begin
  //ShowMessage(cProcHead + ' NOT COMPLETED!');
  { TODO : On Key Press. }
end;

procedure TfpgMapperGUIMainForm.mgOnClose(Sender: TObject;
  var CloseAction: TCloseAction);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.mgOnClose(Sender:TObject;CloseAction:TCloseAction)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.sgOnRowChange(Sender: TObject; ARow: Integer);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.sgOnClick(Sender:TObject)';
var
  zSelectedObject: TtiObject;
  mmListClass, mmItemClass: TtiModelMediator;
  zSubject: TtiObject;
  mv, imv: TtiMediatorView;
  zObject: TtiObject;
  ItemClassName: String;
  IDX: Integer;
  lcic: TagtiListClassToItemCustom;
  ListMediatorName: String;
  ListItemClassType: TClass;
  ListItemMediatorName: String;
  s: String;
begin
  //  ONCLick and OnRowChange:

  // Check for OnClosing, csDetroting.



  // generic onRowChange for a ListClass Mediator.
  //
  //  When a List Control is clicked
  Assert((Assigned(Sender) and (Sender <> nil)), 'sgOnclick(Sender: TObject), Sender Must be assigned and not nil!');

  if Not(Sender is TComponent) then
  begin
    //Log('sgOnclick(Sender: TObject), Sender is not a TComponent');
    exit;
  end;

  if csDestroying in TComponent(Sender).ComponentState then
    exit;

  if csDestroying in ComponentState then
     exit;

  // Get the Mediator View.
  mv := GUIHelper.mlist.FindMediatorView(TComponent(Sender));
  // If Mediator View is Nil, Exit.
  if mv = nil then
  begin
    //Log('sgOnclick(Sender: TObject), No Mediator View found for Sender: TObject of ' + Sender.ClassName + '!');
    Exit;
  end;

  // Since there is a Mediator View of Component, Check that Subject is a ListClass.
  zSubject := mv.Subject;
  if Not(zSubject is TtiObjectList) then
  begin
    //Log('sgOnclick(Sender: TObject), MediatorView.Subject is not of type TtiObjectList.  Not a ListClass.');
    Exit;
  end;

  //Just in case:
  if zSubject = nil then exit;

  //Find the ListItem's MediatorName.
  if GUIHelper.ViewToMediatorNameList.FindByView(TComponent(Sender), IDX) then
  begin
    ListMediatorName := GUIHelper.ViewToMediatorNameList.Items[IDX].MediatorName;
    mmListClass := GUIHelper.mList.ModelMediator(ListMediatorName);
    if mmListClass = nil then
      Exit;
  end
  else Exit;

  // Double Check Subject, zSubject.ClassType should equal mmListClass.Subject.ClassType.
  Assert(zSubject.ClassName = mmListClass.Subject.ClassName, 'zSubject.ClassName and mmListClass.Subject.ClassName do not match');

  // get the selected object:
  zSelectedObject := GUIHelper.mList.SelectedObject[TComponent(Sender)];
  // zSelectedObject is nil or Assigned.

  ItemClassName := '';
  //Determine the ClassType of zSelectedObject wich is the ItemClass.
  lcic := GUIHelper.ListToItemList.FindByListClassMediatorName(ListMediatorName, IDX);
  if IDX > -1 then
  begin
    ItemClassName := lcic.ListClassItemTypeName;
    ListItemClassType := lcic.ListClassItemType;
    ListItemMediatorName := lcic.ListClassItemMediatorName;
  end
  else
  begin
    //  NO ListClass Found:
    Exit;
  end;

  mmItemClass := GUIHelper.mList.ModelMediator(ListItemMediatorName);

  if mmItemClass = nil then
  begin
    log('::mmItemClass := GUIHelper.mList.ModelMediator(ListItemMediatorName); mmItemClass = nil');
    Exit;
  end;

  mmItemClass.Subject := zSelectedObject;
  if zSelectedObject <> nil then
  begin
    mmItemClass.Active := true;
    zSelectedObject.NotifyObservers();
  end;

  DoDependencies(zSelectedObject, ListItemMediatorName, true);
end;

procedure TfpgMapperGUIMainForm.sgOnDoubleClick(Sender: TObject; AButton: TMouseButton; AShift: TShiftState; const AMousePos: TPoint);
begin

end;

procedure TfpgMapperGUIMainForm.DoDependencies(
  aChangedSubject: TtiObject;
  aChangedMediatorName: String;
  IsListItem: Boolean);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.DoDependencies(aChangedSubject:TtiObject;aChangedMediatorName:String;IsListItem:Boolean)';
var
  ic: Integer;
  IDX: Integer;
  DepMap: TagtiMediatorMap;
  DepMediatorName: String;
  DepPropName: String;
  DepPropVar: Variant;
  mmDependent: TtiModelMediator;
  RefData: TtiObject;
  tempObject: TObject;
  aSearchList: TagSearchIndexList;
begin
  try
    aSearchList := TagSearchIndexList.Create;

    if NOT(GUIHelper.MediatorMapList.FindDependentOnMediatorName(aChangedMediatorName, aSearchList)) then
      Exit;

    // iterate DependentMediators:
    for ic := 0 to aSearchList.Count - 1 do
    begin
      DepMap := GUIHelper.MediatorMapList.Items[aSearchList.Items[ic]];
      DepMediatorName := DepMap.PropertyMediatorName;
      //get the model mediator:
      mmDependent := GUIHelper.mList.ModelMediator(DepMediatorName);
      if mmDependent = nil then
      begin
        //Log('Mediator Named: ' + DepMediatorName + ' Not Found!');
        Continue;
        // No Mediator found, skip to next in list.
      end;

      { TODO : What to do if DepMap Dependent Property is '@Selected' }
      //DepMap.DependentOnPropertyName;

     // get the new subject:
     refData := {TSubjectByMediatorName.}SubjectByMediatorName(depMediatorName, aChangedSubject);

      mmDependent.Subject := RefData;
      mmDependent.SubjectChanged;
      if RefData <> nil then
      begin
        mmDependent.Active := true;
        mmDependent.Subject.NotifyObservers();
      end;

      //  6)  Do Depencies of Dependentmediator.
      DoDependencies(RefData, DepMediatorName, false);

    end; // end iterate.
  finally
    aSearchList.Free;
  end;
end;

function TfpgMapperGUIMainForm.GetSelectedObject(Sender: TObject): TtiObject;
const
  cProcHead = 'TfpgMapperGUIMainForm.GetSelectedObject(Sender:TObject)';
var
  mv: TtiMediatorView;
  zSubject: TtiObject;
  IDX: Integer;
  ListMediatorName : string;
  mmListClass: TtiModelMediator;
begin
  // Sender is the Visual component wich selection is determined by.

  result := nil;

  //  When a List Control is clicked
  Assert((Assigned(Sender) and (Sender <> nil)), cProcHead + ', Sender Must be assigned and not nil!');

  if Not(Sender is TComponent) then
  begin
    //Log('sgOnclick(Sender: TObject), Sender is not a TComponent');
    exit;
  end;

  // Get the Mediator View.
  mv := GUIHelper.mlist.FindMediatorView(TComponent(Sender));
  // If Mediator View is Nil, Exit.
  if mv = nil then
  begin
    //Log('sgOnclick(Sender: TObject), No Mediator View found for Sender: TObject of ' + Sender.ClassName + '!');
    Exit;
  end;

  result := mv.SelectedObject;

end;

function TfpgMapperGUIMainForm.GetSelectedObject(
  Sender: TObject;
  var aSelected: TtiObject): Boolean;
const
  cProcHead = 'TfpgMapperGUIMainForm.GetSelectedObject(Sender:TObject;aSelected:TtiObject)';
var
  aSelectedObject: TtiObject;
begin
  //Note: aSelected Object could be nil.
  // returns true, and aSelectedObject = object.
  // returns false otherwise
  try
    result := false;
    aSelectedObject := GetSelectedObject(Sender);
    if aSelectedObject <> nil then
      result := true;
  Except

  end;
end;

//function TfpgMapperGUIMainForm.GetView(Sender: TObject): TtiMediatorView;
//const
//  cProcHead = 'function TfpgMapperGUIMainForm.GetView(Sender:TObject):TtiMediatorView';
//begin
//  // Sender is the Visual component.
//
//  result := nil;
//
//  //Sender must not be Nil and Assigned.
//  Assert((Assigned(Sender) and (Sender <> nil)), cProcHead + ', Sender Must be assigned and not nil!');
//
//  //Sender must be TComponent.
//  if Not(Sender is TComponent) then
//  begin
//    //Log('sgOnclick(Sender: TObject), Sender is not a TComponent');
//    exit;
//  end;
//
//  // Get the Mediator View.
//  result := mlist.FindMediatorView(TComponent(Sender));
//  // result could be nil.
//end;

//function TfpgMapperGUIMainForm.GetView(Sender: TObject;
//  var aView: TtiMediatorView): Boolean;
//const
//  cProcHead = 'function TfpgMapperGUIMainForm.GetView(Sender:TObject;aView:TtiMediatorView):Boolean';
//begin
//  // Sender is the Visual component.
//
//  result := false;
//
//  //Sender must not be Nil and Assigned.
//  Assert((Assigned(Sender) and (Sender <> nil)), cProcHead + ', Sender Must be assigned and not nil!');
//
//  //Sender must be TComponent.
//  if Not(Sender is TComponent) then
//  begin
//    //Log('sgOnclick(Sender: TObject), Sender is not a TComponent');
//    exit;
//  end;
//
//  // Get the Mediator View.
//  aView := mlist.FindMediatorView(TComponent(Sender));
//  if aView <> nil then
//    result := true;
//end;

procedure TfpgMapperGUIMainForm.sgProjectUnitsOnDoubleClick(Sender: TObject;
  AButton: TMouseButton; AShift: TShiftState; const AMousePos: TPoint);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.sgProjectUnitsOnDoubleClick(Sender:TObject;AButton:TMouseButton;AShift:TShiftState;AMousePos:TPoint)';
begin

  //ShowMessage(' Sender: ' + Sender.ClassName);

  if GUIHelper.IsViewSelected(Sender) then
  begin

    { TODO : Change this to check a Map to action list. }

    case TComponent(Sender).Name of
    'sgProjectUnits': miProjectUnitsRename(Sender);

    else

    end;
  end;
end;

procedure TfpgMapperGUIMainForm.sgProjectUnitsOnFocusChange(Sender: TObject;
  ARow, ACol: Integer);
begin
//  UpdateWindowTitle;
end;

procedure TfpgMapperGUIMainForm.sgProjectUnitsOnRowChange(Sender: TObject;
  ARow: Integer);
begin
  sgOnRowChange(Sender, ARow);
//  UpdateWindowTitle;
end;

procedure TfpgMapperGUIMainForm.UpdateWindowTitle;
begin
  WindowTitle :=
    'sgProjectUnits:  Focus: Row = ' + IntToStr(sgProjectUnits.FocusRow) +
    'Col = ' + IntToStr(sgProjectUnits.FocusCol) +
    ' Selected Row = ' + IntToStr(sgProjectUnits.FocusRow);
end;

procedure TfpgMapperGUIMainForm.miHelpScrollFrame(Sender: TObject);
const
  cProcHead = 'procedure TfpgMapperGUIMainForm.miHelpScrollFrame(Sender:TObject)';
begin
  ShowMessage(cProcHead + ' NOT COMPLETED!');
end;

procedure TfpgMapperGUIMainForm.miHelpDefaultDialog(Sender: TObject);
var
  f: TfpgMGDefaultDialog;
begin
  try
    f := TfpgMGDefaultDialog.Create(self);
    f.Data := Data;
    f.ShowModal;
  finally
    f.Free;
  end;
//  F.Edit(Data);
end;

procedure TfpgMapperGUIMainForm.miHelpIncludeDialog(Sender: TObject);
var
  f: TfpgMGIncludesDlg;
begin
  try
    f := TfpgMGIncludesDlg.Create(self);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfpgMapperGUIMainForm.miHelpSelectFileDialog(Sender: TObject);
var
  s: string;
begin
  s := fpg_Dialogs.SelectFileDialog(True, 'xml Files|*.xml');
  //ShowMessage(s);
end;

procedure TfpgMapperGUIMainForm.miHelpEnumDialog(Sender: TObject);
var
  f: TfpgMGEnumDlg;
begin
  try
    f := TfpgMGEnumDlg.Create(self);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure TfpgMapperGUIMainForm.miHelpShowmListNames(Sender: TObject);
begin
  ShowmListNames;
end;

procedure TfpgMapperGUIMainForm.miHelpShowmListViews(Sender: TObject);
begin
  ShowmListViews;
end;

procedure TfpgMapperGUIMainForm.miHelpListClass(Sender: TObject);
var
  ic: Integer;
begin
  ShowMessage(GUIHelper.GetNamesOfListClasses);
end;

procedure TfpgMapperGUIMainForm.miHelpUpdateUnitName(Sender: TObject);
begin
  GUIHelper.mList.MediatorView[lblProjectUnitName].NotifyObservers();
end;

procedure TfpgMapperGUIMainForm.miHelpShowSubjectClasses(Sender: TObject);
var
  ic: Integer;
  s: String;
  io: TtiObject;
  mm: TtiModelMediator;
begin
  for ic := 0 to GUIHelper.mList.ModelMediators.Count - 1 do
  begin
    mm := GUIHelper.mList.ModelMediators[ic].ModelMediator;
    io := mm.Subject;
    s := s + IntToStr(ic) + ') Name = ' + GUIHelper.mList.ModelMediators[ic].ModelMediatorName + '  Subject = ';
    if io <> nil then
       s := s + io.ClassName + LineEnding
    else
      s := s + 'NIL' + LineEnding;
  end;
  showMessage('mList Mediator Subject Classes: ' + LineEnding + s);
end;

procedure TfpgMapperGUIMainForm.miHelpShowViews(Sender: TObject);
begin
  agtiMessageMemo.ShowMessageMemo(GUIHelper.ViewToMediatorNameList.AsDebugString());
end;

procedure TfpgMapperGUIMainForm.miHelpShowMaps(Sender: TObject);
begin
  agtiMessageMemo.ShowMessageMemo(GUIHelper.MediatorMapList.AsDebugString());
end;

procedure TfpgMapperGUIMainForm.miHelpShowClassEditDlg(Sender: TObject);
var
  f: TfpgMGClassDlg;
begin
  if not(Assigned(testClassDef))then
    testClassDef := TGMapClassDef.Create;

  f := TfpgMGClassDlg.Create(self);//, testClassDef);
  f.SetDataOnce(testClassDef);
  f.ShowModal;
  f.Free;
  //try
  //  TfpgMGClassDlg.Edit(testClassDef);// := TfpgMGClassDlg.Create(self);
  //  //f.SetDataOnce(testClassDef);
  //  //f.ShowModal;
  //finally
  //  //f.Free;
  //end;
end;

procedure TfpgMapperGUIMainForm.ShowmListNames;
var
  s: String;
  ic: Integer;
begin
  s := 'ModelMediator Names:' +#10;
  for ic := 0 to GUIHelper.mList.ModelMediators.Count - 1 do
  begin
    s := s + GUIHelper.mList.ModelMediators.Items[ic].ModelMediatorName+ #13;
  end;

  ShowMessage(s);
end;

procedure TfpgMapperGUIMainForm.ShowmListViews;
var
  s: String;
  mname: String;
  ic: Integer;
  ip: Integer;
  mm: TtiModelMediator;
begin
  s := 'ModelMediator Views:' + LineEnding;
  for ic := 0 to GUIHelper.mList.ModelMediators.Count - 1 do
  begin
    mm := GUIHelper.mList.ModelMediators[ic].ModelMediator;
    for ip  := 0 to mm.PropertyLinks.Count - 1 do
    begin
      S := s + IntToStr(ic) + '.' + inttoStr(ip) + ': ' + mm.PropertyLinks.Defs[ip].Component.Name + LineEnding;
    end;
  end;

  ShowMessage(s);
end;

constructor TfpgMapperGUIMainForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  GUIHelper := TagtiGUIHelper.Create(Self);
  GUIHelper.OnSubjectByMediatorName := {TSubjectByMediatorName.}@SubjectByMediatorName;
end;

destructor TfpgMapperGUIMainForm.Destroy;
begin
  { TODO : Maybe Save Deleted Units? }
  { TODO : Check if data saved,  }
  FDeletedUnits.Free;
  GUIHelper.Free;

  inherited Destroy;
end;

procedure TfpgMapperGUIMainForm.AfterCreate;
begin
  {%region 'Auto-generated GUI code' }
  {@VFD_BODY_BEGIN: fpgMapperGUIMainForm}
  Name := 'fpgMapperGUIMainForm';
  SetPosition(453, 131, 900, 600);
  WindowTitle := 'fpgMapperGUIMainForm';
  Hint := '';
  IconName := '';
  BackGroundColor := $80000001;
  //MainForm:
  //Left Panel:
  //Right Panel:

  mbMainMenu := TfpgMenuBar.Create(self);
  with mbMainMenu do
  begin
    Name := 'mbMainMenu';
    SetPosition(0, 0, 501, 25);
    Anchors := [anLeft,anRight,anTop];
    Align   := alTop;
  end;

  PnlProjectName := TfpgPanel.Create(self);
  with PnlProjectName do
  begin
    Name := 'PnlProjectName';
    SetPosition(0, 0, 900, 25);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  lblProjectNameLabel := TfpgLabel.Create(PnlProjectName);
  with lblProjectNameLabel do
  begin
    Name := 'lblProjectNameLabel';
    SetPosition(2, 2, 150, 21);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Project Name: ';
    AutoSize := True;
  end;

  lblProjectName := TfpgLabel.Create(PnlProjectName);
  with lblProjectName do
  begin
    Name := 'lblProjectName';
    SetPosition(652, -46, 501, 21);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Not Assigned.';
    Autosize := True;
  end;

  PnlProjectFileName := TfpgPanel.Create(self);
  with PnlProjectFileName do
  begin
    Name := 'PnlProjectFileName';
    SetPosition(0, 25, 900, 30);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  lblProjectFileNameLabel := TfpgLabel.Create(PnlProjectFileName);
  with lblProjectFileNameLabel do
  begin
    Name := 'lblProjectFileNameLabel';
    SetPosition(2, 2, 150, 26);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Project FileName: ';
    Autosize := True;
  end;

  lblProjectFileName := TfpgLabel.Create(PnlProjectFileName);
  with lblProjectFileName do
  begin
    Name := 'lblProjectFileName';
    SetPosition(152, 2, 501, 26);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Not Assigned.';
    AutoSize := True;
  end;

  PnlProject := TfpgPanel.Create(self);
  with PnlProject do
  begin
    Name := 'PnlProject';
    SetPosition(0, 55, 300, 545);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  pcProject := TfpgPageControl.Create(PnlProject);
  with pcProject do
  begin
    Name := 'pcProject';
    SetPosition(2, 2, 296, 541);
    ActivePageIndex := 1;
    Align := alClient;
    Hint := '';
    TabOrder := 1;
  end;

  tsProjectSettings := TfpgTabSheet.Create(pcProject);
  with tsProjectSettings do
  begin
    Name := 'tsProjectSettings';
    SetPosition(3, 24, 290, 514);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Project Settings';
    Align   := alClient;
  end;

  tsProjectUnits := TfpgTabSheet.Create(pcProject);
  with tsProjectUnits do
  begin
    Name := 'tsProjectUnits';
    SetPosition(3, 24, 290, 514);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Project Units';
    Align   := alClient;
  end;

  sgProjectUnits := TfpgStringGrid.Create(tsProjectUnits);
  with sgProjectUnits do
  begin
    Name := 'sgProjectUnits';
    SetPosition(0, 0, 290, 514);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GuiHelper.RowChange;// @sgOnRowChange;
  end;

  tsProjectClasses := TfpgTabSheet.Create(pcProject);
  with tsProjectClasses do
  begin
    Name := 'tsProjectClasses';
    SetPosition(3, 24, 290, 514);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Project Classes';
    Align := alClient;
  end;

  sgProjectClasses := TfpgStringGrid.Create(tsProjectClasses);
  with sgProjectClasses do
  begin
    Name := 'sgProjectClasses';
    SetPosition(0, 0, 290, 514);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GUIHelper.RowChange;// @sgOnRowChange;
  end;

  tsProjectEnums := TfpgTabSheet.Create(pcProject);
  with tsProjectEnums do
  begin
    Name := 'tsProjectEnums';
    SetPosition(3, 24, 290, 514);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Project Enums';
    Align   := alClient;
  end;

  sgProjectEnums := TfpgStringGrid.Create(tsProjectEnums);
  with sgProjectEnums do
  begin
    Name := 'sgProjectEnums';
    SetPosition(0, 0, 290, 514);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GUIHelper.RowChange;//@sgOnRowChange;
  end;

  tsProjectIncludes := TfpgTabSheet.Create(pcProject);
  with tsProjectIncludes do
  begin
    Name := 'tsProjectIncludes';
    SetPosition(0, 0, 100, 100);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Project Includes';
    Align   := alClient;
  end;

  sgProjectIncludes := TfpgStringGrid.Create(tsProjectIncludes);
  with sgProjectIncludes do
  begin
    Name := 'sgProjectIncludes';
    SetPosition(0, 0, 100, 100);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GUIHelper.RowChange;//@sgOnRowChange;
  end;

  Splitter1 := TfpgSplitter.Create(self);
  with Splitter1 do
  begin
    Name := 'Splitter1';
    SetPosition(300, 55, 8, 545);
    Align := alLeft;
  end;

  pnlUnit := TfpgPanel.Create(self);
  with pnlUnit do
  begin
    Name := 'pnlUnit';
    SetPosition(308, 55, 592, 545);
    Align := alClient;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  pnlUnitName := TfpgPanel.Create(pnlUnit);
  with pnlUnitName do
  begin
    Name := 'pnlUnitName';
    SetPosition(2, 2, 588, 30);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  lblUnitNameLabel := TfpgLabel.Create(pnlUnitName);
  with lblUnitNameLabel do
  begin
    Name := 'lblUnitNameLabel';
    SetPosition(2, 2, 150, 26);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Unit Name:';
    Autosize := True;
  end;

  lblProjectUnitName := TfpgLabel.Create(pnlUnitName);
  with lblProjectUnitName do
  begin
    Name := 'lblProjectUnitName';
    SetPosition(152, 2, 150, 26);
    Align := alLeft;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Not Assigned.';
    Autosize := True;
  end;

  pcUnit := TfpgPageControl.Create(pnlUnit);
  with pcUnit do
  begin
    Name := 'pcUnit';
    SetPosition(2, 32, 588, 511);
    Align := alClient;
    Hint := '';
    TabOrder := 1;
  end;

  tsClasses := TfpgTabSheet.Create(pcUnit);
  with tsClasses do
  begin
    Name := 'tsClasses';
    SetPosition(3, 24, 582, 484);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Classes';
  end;

  sgUnitClasses := TfpgStringGrid.Create(self);
  with sgUnitClasses do
  begin
    Name := 'sgUnitClasses';
    SetPosition(308, 55, 592, 545);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GUIHelper.RowChange;//@sgOnRowChange;
  end;

  tsUnitEnums := TfpgTabSheet.Create(pcUnit);
  with tsUnitEnums do
  begin
    Name := 'tsUnitEnums';
    SetPosition(3, 24, 582, 484);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'Enumerations';
  end;

  sgUnitEnums := TfpgStringGrid.Create(tsUnitEnums);
  with sgUnitEnums do
  begin
    Name := 'sgUnitEnums';
    SetPosition(0, 0, 582, 484);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GUIHelper.RowChange;//@sgOnRowChange;
  end;

  tsUnitReferences := TfpgTabSheet.Create(pcUnit);
  with tsUnitReferences do
  begin
    Name := 'tsUnitReferences';
    SetPosition(3, 24, 379, 358);
    Anchors := [anLeft,anRight,anTop,anBottom];
    Text := 'References';
  end;

  sgUnitReferences := TfpgStringGrid.Create(tsUnitReferences);
  with sgUnitReferences do
  begin
    Name := 'sgUnitReferences';
    SetPosition(0, 0, 379, 358);
    Align := alClient;
    BackgroundColor := TfpgColor($80000002);
    FontDesc := '#Grid';
    HeaderFontDesc := '#GridHeader';
    Hint := '';
    RowCount := 0;
    RowSelect := False;
    TabOrder := 1;
    OnDoubleClick := @sgOnDoubleClick;
    OnRowChange := @GUIHelper.RowChange;//@sgOnRowChange;
  end;

  pmFile := TfpgPopupMenu.Create(self);
  with pmFile do
  begin
    Name := 'pmFile';
    SetPosition(300, 212, 120, 32);
    {File Sub Menu Items: Template: agmfi}
    AddMenuItem('New', rsKeyCtrl + 'N', @miFileNew);
    AddMenuItem('Open', rsKeyCtrl + 'O', @miFileOpen);
    AddMenuItem('Save', rsKeyCtrl + 'S', @miFileSave);
    AddMenuItem('Save As', rsKeyCtrl + rsKeyShift + 'S', @miFileSaveAs);
    AddMenuItem('-', '', nil);
    AddMenuItem('Save & Reload', '', @miFileSaveReload);
    AddMenuItem('-', '', nil);
    AddMenuItem('Quit', rsKeyCtrl + 'Q', @miFileQuit);
    AddMenuItem('-', '', nil);
    AddMenuItem('Recent', rsKeyCtrl + 'O', @miFileRecent);
    {File Sub Menu Items: Template: agmfi End.}
  end;

  pmEdit := TfpgPopupMenu.Create(self);
  with pmEdit do
  begin
    Name := 'pmEdit';
    SetPosition(300, 257, 120, 32);
    {Menu: Edit Sub Menu: Template agmei}
    AddMenuItem('Cut', rsKeyCtrl + 'X', @miEditCut);
    AddMenuItem('Copy', rsKeyCtrl + 'C', @miEditCopy);
    AddMenuItem('Paste', rsKeyCtrl + 'V', @miEditPaste);
    AddMenuItem('-', '', nil);
    AddMenuItem('Spell check', 'F4', @miEditSpellCheck).Enabled := False;
    {Menu: Edit Sub Menu: Template agmei}
  end;

  pmEditSelect := TfpgPopupMenu.Create(self);
  with pmEditSelect do
  begin
    Name := 'pmEditSelect';
    SetPosition(300, 172, 120, 32);
    {fpGUI Menu: Edit Select Sub Menu Items: Template agmesi}
    AddMenuItem('Select All', '', @miEditSelectAll);
    AddMenuItem('Select Word', '', @miEditSelectWord);
    AddMenuItem('Select Line', '', @miEditSelectLine);
    {fpGUI Menu: Edit Select Sub Menu Items: Template agmesi End.}
    pmEdit.AddMenuItem('Selec&t', '', nil).SubMenu := pmEditSelect;
  end;

  pmView := TfpgPopupMenu.Create(self);
  with pmView do
  begin
    Name := 'pmView';
    SetPosition(300, 298, 120, 32);
    {fpGUI Menu: View Sub Menu Items: Template agmvi}
    AddMenuItem('Full Screen', '', @miViewFullScreen);
    AddMenuItem('Tool Bar', '', @miViewToolBar).Checked := True;
    AddMenuItem('Status Bar', '', @miViewStatusBar).Checked := True;
    AddMenuItem('Line Numbers', '', @miViewLineNumbers);
    {fpGUI Menu: View Sub Menu Items: Template agmvi End.}
  end;

  pmHelp := TfpgPopupMenu.Create(self);
  with pmHelp do
  begin
    Name := 'pmHelp';
    SetPosition(300, 135, 120, 32);
    {fpGUI Menu: Help Sub Menu Items: Template agmhi}
    AddMenuItem('&Help', 'F11', @miHelpHelp);
    AddMenuItem('&About', 'F12', @miHelpAbout);
    {fpGUI Menu: Help Sub Menu Items: Template agmhi}
  end;

  pmProjectUnits := TfpgPopupMenu.Create(sgProjectUnits);
  with pmProjectUnits do
  begin
    Name := 'pmProjectUnits';
    SetPosition(128, 156, 120, 32);
    //Parent := sgProjectUnits;
    AddMenuItem('&New Unit', rsKeyCtrl + 'N', @miProjectUnitsNew);
    AddMenuItem('&Rename Unit', rsKeyCtrl + 'R', @miProjectUnitsRename);
    AddMenuItem('&Delete Unit', rsKeyCtrl + 'D', @miProjectUnitsDelete);
    AddMenuItem('&Sort Units', rsKeyCtrl + 'S', @miProjectUnitsSort);
  end;

  pmProjectEnums := TfpgPopupMenu.Create(sgProjectEnums);
  with pmProjectEnums do
  begin
    Name := 'pmProjectEnums';
    SetPosition(128, 188, 120, 32);
    AddMenuItem('&New Enum', rsKeyCtrl + 'N', @miProjectEnumsNew);
    AddMenuItem('&Edit Enum', rsKeyCtrl + 'E', @miProjectEnumsEdit);
    AddMenuItem('&Delete Enum', rsKeyCtrl + 'D', @miProjectEnumsDelete);
    AddMenuItem('&Sort Enums', rsKeyCtrl + 'S', @miProjectEnumsSort);
  end;

  pmProjectIncludes := TfpgPopupMenu.Create(sgProjectIncludes);
  with pmProjectIncludes do
  begin
    Name := 'pmProjectIncludes';
    SetPosition(128, 220, 120, 32);
    AddMenuItem('&New Include', rsKeyCtrl + 'N', @miProjectIncludesNew);
    AddMenuItem('&Edit Include', rsKeyCtrl + 'E', @miProjectIncludesEdit);
    AddMenuItem('&Delete Include', rsKeyCtrl + 'D', @miProjectIncludesDelete);
    AddMenuItem('&Sort Includes', rsKeyCtrl + 'S', @miProjectIncludesSort);
  end;

  pmUnitClasses := TfpgPopupMenu.Create(sgUnitClasses);
  with pmUnitClasses do
  begin
    Name := 'pmUnitClasses';
    SetPosition(128, 188, 120, 32);
    AddMenuItem('&New Class', rsKeyCtrl + 'N', @miUnitClassesNew);
    AddMenuItem('&Edit Class', rsKeyCtrl + 'E', @miUnitClassesEdit);
    AddMenuItem('&Delete Class', rsKeyCtrl + 'D', @miUnitClassesDelete);
    AddMenuItem('&Sort Classes', rsKeyCtrl + 'S', @miUnitClassesSort);
  end;

  pnlProjectSettings := TfpgPanel.Create(tsProjectSettings);
  with pnlProjectSettings do
  begin
    Name := 'pnlProjectSettings';
    SetPosition(0, 0, 290, 514);
    Align := alClient;
    FontDesc := '#Label1';
    Hint := '';
    Text := '';
  end;

  LblProjectSettingsFilename := TfpgLabel.Create(pnlProjectSettings);
  with LblProjectSettingsFilename do
  begin
    Name := 'LblProjectSettingsFilename';
    SetPosition(2, 2, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Project FileName:';
  end;

  fedtProjectFilename := TfpgFileNameEdit.Create(pnlProjectSettings);
  with fedtProjectFilename do
  begin
    Name := 'fedtProjectFilename';
    SetPosition(2, 18, 286, 24);
    Align := alTop;
    ExtraHint := '';
    FileName := '';
    Filter := '';
    InitialDir := '';
    TabOrder := 3;
  end;

  lblSettingsProjectName := TfpgLabel.Create(pnlProjectSettings);
  with lblSettingsProjectName do
  begin
    Name := 'lblSettingsProjectName';
    SetPosition(2, 42, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'ProjectName:';
  end;

  edtProjectName := TfpgEdit.Create(pnlProjectSettings);
  with edtProjectName do
  begin
    Name := 'edtProjectName';
    SetPosition(2, 58, 286, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    Hint := '';
    TabOrder := 4;
    Text := '';
  end;

  lblProjectOrigOutDirectory := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectOrigOutDirectory do
  begin
    Name := 'lblProjectOrigOutDirectory';
    SetPosition(2, 82, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'OrigOutDirectory:';
  end;

  dedtProjectOrigOutDirectory := TfpgDirectoryEdit.Create(pnlProjectSettings);
  with dedtProjectOrigOutDirectory do
  begin
    Name := 'dedtProjectOrigOutDirectory';
    SetPosition(2, 98, 286, 24);
    Align := alTop;
    Directory := '';
    ExtraHint := '';
    RootDirectory := '';
    TabOrder := 6;
  end;

  lblProjectOutputDirectory := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectOutputDirectory do
  begin
    Name := 'lblProjectOutputDirectory';
    SetPosition(2, 122, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'OutputDirectory:';
  end;

  dedtProjectOutputDirectory := TfpgDirectoryEdit.Create(pnlProjectSettings);
  with dedtProjectOutputDirectory do
  begin
    Name := 'dedtProjectOutputDirectory';
    SetPosition(2, 138, 286, 24);
    Align := alTop;
    Directory := '';
    ExtraHint := '';
    RootDirectory := '';
    TabOrder := 8;
  end;

  lblProjectBaseDirectory := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectBaseDirectory do
  begin
    Name := 'lblProjectBaseDirectory';
    SetPosition(2, 162, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'BaseDirectory:';
  end;

  dedtBaseDirectory := TfpgDirectoryEdit.Create(pnlProjectSettings);
  with dedtBaseDirectory do
  begin
    Name := 'dedtBaseDirectory';
    SetPosition(2, 178, 286, 24);
    Align := alTop;
    Directory := '';
    ExtraHint := '';
    RootDirectory := '';
    TabOrder := 10;
  end;

  lblProjectTabSpaces := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectTabSpaces do
  begin
    Name := 'lblProjectTabSpaces';
    SetPosition(2, 202, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Tab Spaces';
  end;

  edtTabSpaces := TfpgEditInteger.Create(pnlProjectSettings);
  with edtTabSpaces do
  begin
    Name := 'edtTabSpaces';
    SetPosition(2, 218, 286, 24);
    Align := alTop;
    FontDesc := '#Edit1';
    Hint := '';
    MaxValue := 20;
    MinValue := 0;
    TabOrder := 12;
    Value := 2;
  end;

  lblProjectBeginEndTabs := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectBeginEndTabs do
  begin
    Name := 'lblProjectBeginEndTabs';
    SetPosition(2, 242, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Begin End Tabs:';
  end;

  edtProjectBeginEndTabs := TfpgEditInteger.Create(pnlProjectSettings);
  with edtProjectBeginEndTabs do
  begin
    Name := 'edtProjectBeginEndTabs';
    SetPosition(2, 258, 286, 24);
    Align := alTop;
    FontDesc := '#Edit1';
    Hint := '';
    MaxValue := 20;
    MinValue := 0;
    TabOrder := 14;
    Value := 2;
  end;

  lblProjectVisibilityTabs := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectVisibilityTabs do
  begin
    Name := 'lblProjectVisibilityTabs';
    SetPosition(2, 282, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Visibility  Tabs:';
  end;

  edtProjectVisibilityTabs := TfpgEditInteger.Create(pnlProjectSettings);
  with edtProjectVisibilityTabs do
  begin
    Name := 'edtProjectVisibilityTabs';
    SetPosition(2, 298, 286, 24);
    Align := alTop;
    FontDesc := '#Edit1';
    Hint := '';
    MaxValue := 20;
    MinValue := 0;
    TabOrder := 16;
    Value := 2;
  end;

  lblProjectMaxEditorCodeWidth := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectMaxEditorCodeWidth do
  begin
    Name := 'lblProjectMaxEditorCodeWidth';
    SetPosition(2, 322, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'Max Editor Code Wiidth:';
  end;

  edtMaxEditorCodeWidth := TfpgEditInteger.Create(pnlProjectSettings);
  with edtMaxEditorCodeWidth do
  begin
    Name := 'edtMaxEditorCodeWidth';
    SetPosition(2, 338, 286, 24);
    Align := alTop;
    FontDesc := '#Edit1';
    Hint := '';
    MaxValue := 1000;
    MinValue := 0;
    TabOrder := 18;
    Value := 80;
  end;

  lblProjectEnumType := TfpgLabel.Create(pnlProjectSettings);
  with lblProjectEnumType do
  begin
    Name := 'lblProjectEnumType';
    SetPosition(2, 362, 286, 16);
    Align := alTop;
    FontDesc := '#Label1';
    Hint := '';
    Text := 'EnumType';
  end;

  cbProjectEnumType := TfpgComboBox.Create(pnlProjectSettings);
  with cbProjectEnumType do
  begin
    Name := 'cbProjectEnumType';
    SetPosition(2, 378, 286, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#List';
    Hint := '';
    FocusItem := -1;
    TabOrder := 20;
  end;

  {@VFD_BODY_END: fpgMapperGUIMainForm}
  {%endregion}

  // Assign popupmenus to controls:
  sgProjectUnits.PopupMenu := pmProjectUnits;
  sgProjectEnums.PopupMenu := pmProjectEnums;
  sgProjectIncludes.PopupMenu := pmProjectIncludes;

  sgUnitClasses.PopupMenu := pmUnitClasses;

  // Add Menus to Main Menu:
  mbMainMenu.AddMenuItem('&File', nil).SubMenu := pmFile;
  mbMainMenu.AddMenuItem('&Edit', nil).SubMenu := pmEdit;
  mbMainMenu.AddMenuItem('&View', nil).SubMenu := pmView;
  mbMainMenu.AddMenuItem('&Help', nil).SubMenu := pmHelp;
  {fpGUI Menu: Help Sub Menu Items: Template agmhi}

  //Application events:
  fpgApplication.OnException := @mgOnException;
  fpgApplication.OnIdle      := @mgOnIdle;
  fpgApplication.OnKeyPress  := @mgOnKeyPress;

  //Setup any Property members:
  FDeletedUnits := TGMapUnitDefList.Create;
  FLabelPanelPad := 5;

  //Adjust label panels sizes:
  ResizeLabelPanels;

  //Create our MediatorList:
  GUIHelper.mList := TtiModelMediatorList.Create(self);
  GUIHelper.mList.Name := Self.ClassName + 'ModelMediators';

  //Form Events:
  OnClose := @mgOnClose;

  //Test Dialogs:
  with pmHelp do
  begin
    AddMenuItem('ScrollFrame', '', @miHelpScrollFrame);
    AddMenuItem('DefaultDialog', '', @miHelpDefaultDialog);
    AddMenuItem('IncludeDialog', '', @miHelpIncludeDialog);
    AddMenuItem('Select File Dialog', '', @miHelpSelectFileDialog);
    AddmenuItem('Enum Dialog', '', @miHelpEnumDialog);
    AddMenuItem('Show mList Names', '', @miHelpShowmListNames);
    AddMenuItem('Show mList Views', '', @miHelpShowmListViews);
    AddMenuItem('ShowListClass', '', @miHelpListClass);
    AddMenuItem('Update Selected Unit Name','', @miHelpUpdateUnitName);
    AddMenuItem('Show Subject Classes','',@miHelpShowSubjectClasses);
    AddMenuItem('Show Views List', '', @miHelpShowViews);
    AddMenuItem('Show Mediator Maps', '', @miHelpShowMaps);
    AddMenuItem('Show Class Edit Dialog', '', @miHelpShowClassEditDlg);
  end;

  //Register any custom mediators:
  RegisterMediators;

  //Set out Data:
  Data := gMGDataManager.NewProjectDM(False).Data;

end;

procedure TfpgMapperGUIMainForm.Log(msg: String);
begin
//  ShowMessage(msg);
  gLog.Log(msg);
end;

procedure TfpgMapperGUIMainForm.Log(aProcedure: String; msg: String);
begin
  log(aProcedure + '::' + msg);
end;

initialization
  RegisterFallbackMediators;
  RegisterFallbackListMediators;
end.
