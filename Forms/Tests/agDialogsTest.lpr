program agDialogsTest;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, typinfo,
  fpg_base, fpg_main, fpg_form, fpg_Dialogs,
  agfpgBaseDialog, agfpgBaseDialogEdit, agfpgMessageDlg, agfpgBaseDialogEditTiopf,
  TestFormMapper, frmfpgmgclassDlg,
  mapper, GuiMapper,
  {%units 'Auto-generated GUI code'}
  fpg_button, fpg_edit, fpg_label
  {%endunits}
  ;

type

  { TMainForm }

  TMainForm = class(TfpgForm)
  private
    {@VFD_HEAD_BEGIN: MainForm}
    TbtnBaseShow: TfpgButton;
    edtBaseShow: TfpgEdit;
    btnBaseShowModal: TfpgButton;
    edtBaseShowModal: TfpgEdit;
    btnBaseDialogEdit: TfpgButton;
    edtBaseDialogEdit: TfpgEdit;
    btnDialogMessage: TfpgButton;
    edtDialogMessage: TfpgEdit;
    btnTiDialog: TfpgButton;
    btnClassDlg: TfpgButton;
    {@VFD_HEAD_END: MainForm}

  protected
    fMapProject: TMapProject;
    fMapClassDef: TGMapClassDef;

  public
    procedure AfterCreate; override;

    procedure btnBaseShowClick(Sender: TObject);
    procedure btnBaseShowModalClick(Sender: TObject);
    procedure btnBaseDialogEditClick(Sender: TObject);
    procedure btnDialogMessageClick(Sender: TObject);
    procedure btnTiDialogClick(Sender: TObject);
    procedure btnTestForm1Click(Sender: TObject);
    procedure btnClassDlgClick(Sender: TObject);

  end;

{@VFD_NEWFORM_DECL}



{@VFD_NEWFORM_IMPL}

procedure TMainForm.AfterCreate;
begin
  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: MainForm}
  Name := 'MainForm';
  SetPosition(852, 267, 300, 482);
  WindowTitle := 'MainForm';
  IconName := '';
  BackGroundColor := $80000001;

  TbtnBaseShow := TfpgButton.Create(self);
  with TbtnBaseShow do
  begin
    Name := 'TbtnBaseShow';
    SetPosition(0, 0, 300, 24);
    Align := alTop;
    Text := 'TagpgpBaseDialog Show';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 1;
    Hint := '';
    OnClick := @btnBaseShowClick;
  end;

  edtBaseShow := TfpgEdit.Create(self);
  with edtBaseShow do
  begin
    Name := 'edtBaseShow';
    SetPosition(0, 24, 300, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 2;
    Text := '';
  end;

  btnBaseShowModal := TfpgButton.Create(self);
  with btnBaseShowModal do
  begin
    Name := 'btnBaseShowModal';
    SetPosition(0, 48, 300, 24);
    Align := alTop;
    Text := 'TagfpgBaseDialog ShowModal';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 3;
    OnCLick := @btnBaseShowModalClick;
  end;

  edtBaseShowModal := TfpgEdit.Create(self);
  with edtBaseShowModal do
  begin
    Name := 'edtBaseShowModal';
    SetPosition(0, 72, 300, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 4;
    Text := '';
  end;

  btnBaseDialogEdit := TfpgButton.Create(self);
  with btnBaseDialogEdit do
  begin
    Name := 'btnBaseDialogEdit';
    SetPosition(0, 96, 300, 24);
    Align := alTop;
    Text := 'TagfpgBaseDialogEdit';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 5;
    OnClick := @btnBaseDialogEditClick;
  end;

  edtBaseDialogEdit := TfpgEdit.Create(self);
  with edtBaseDialogEdit do
  begin
    Name := 'edtBaseDialogEdit';
    SetPosition(0, 120, 300, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 6;
    Text := '';
  end;

  btnDialogMessage := TfpgButton.Create(self);
  with btnDialogMessage do
  begin
    Name := 'btnDialogMessage';
    SetPosition(0, 144, 300, 24);
    Align := alTop;
    Text := 'TagfpgDialogMessage';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 7;
    OnClick := @btnDialogMessageClick;
  end;

  edtDialogMessage := TfpgEdit.Create(self);
  with edtDialogMessage do
  begin
    Name := 'edtDialogMessage';
    SetPosition(0, 168, 300, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 8;
    Text := '';
  end;

  btnTiDialog := TfpgButton.Create(self);
  with btnTiDialog do
  begin
    Name := 'btnTiDialog';
    SetPosition(0, 192, 300, 24);
    Align := alTop;
    Text := 'TagfpgBaseDialogTiopf Edit';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 9;
    OnClick := @btnTiDialogClick;
  end;

  btnClassDlg := TfpgButton.Create(self);
  with btnTiDialog do
  begin
    Name := 'btnClassDialog';
    SetPosition(0, 216, 300, 24);
    Align := alTop;
    Text := 'TfrmfpgMGClassDlg Edit';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 9;
    OnClick := @btnClassDlgClick;
  end;

  {@VFD_BODY_END: MainForm}
  {%endregion}


  WindowTitle := 'MainForm: ' + IntToStr(fpgApplication.GetScreenWidth) + ', ' +
    IntToStr(fpgApplication.GetScreenHeight);
end;

procedure TMainForm.btnBaseShowClick(Sender: TObject);
begin


end;

procedure TMainForm.btnBaseShowModalClick(Sender: TObject);
var
  dlg: TagfpgBaseDialog;
  res: TfpgModalResult;
  pyi: PTypeInfo;
begin
  dlg := TagfpgBaseDialog.Create(nil);
  res := dlg.ShowModal;
  pyi := Typeinfo(TfpgModalResult);
  edtBaseShowModal.Text := GetEnumName(pyi, Integer(dlg.ModalResult));
  dlg.Free;
end;

procedure TMainForm.btnBaseDialogEditClick(Sender: TObject);
var
  mr: TfpgModalResult;
begin
  mr := TagfpgBaseDialogEdit.Edit(100, 100, 300, 300);
  edtBaseDialogEdit.Text := TagfpgBaseDialogEdit.ModalResultStr(mr);
end;

procedure TMainForm.btnDialogMessageClick(Sender: TObject);
var
  mr: TfpgModalResult;
  s: String;
begin
  s := 'Test Message.' + LineEnding +
    'Another Line.' + LineEnding +
    'Last Line.';
  mr := TagfpgMessageDlg.Edit(s, 'A Test MEssage.', true,100, 100, 300, 300);
end;

procedure TMainForm.btnTiDialogClick(Sender: TObject);
begin
  if not(Assigned(FMapProject)) then
     FMapProject := TMapProject.Create;

  if FMapProject.ProjectName = '' then
    FMapProject.ProjectName := 'TestProject' + IntToStr(Random(1000));

  ShowMessage(FMapProject.AsDebugString());

  TTestFormMapper.Edit(FMapProject, 100, 100, 300, 300 );

  ShowMessage(FMapProject.AsDebugString());

end;

procedure TMainForm.btnTestForm1Click(Sender: TObject);
begin


end;

procedure TMainForm.btnClassDlgClick(Sender: TObject);
begin
  Randomize;
  if not assigned(FMapClassDef) then
    FMapClassDef := TGMapClassDef.Create;

   if FMapClassDef.BaseClassName = '' then
     FMapClassDef.BaseClassName := 'TestClass' + IntToStr(Random(1000));

   ShowMessage(FMapClassDef.AsDebugString());

   TfpgMGClassDlg.Edit(FMapClassDef, 100, 100, 400, 500);

   ShowMessage(FMapClassDef.AsDebugString());
end;

procedure MainProc;
var
  frm: TMainForm;
begin

    {$if declared(UseHeapTrace)}
    //CompilerOptions-Debugging-UseHeapTrc Unit -gh
    GlobalSkipIfNoLeaks := false; // supported as of debugger version 3.1.1
     if FileExists('heap.trc') then
      DeleteFile('heap.trc');
    SetHeapTraceOutput('trace.log'); // supported as of debugger version 3.1.1
    UseHeapTrace := true;
    HaltOnError := true;
    {$endif}

  //To get meaningful heaptrc results with descriptions to your code lines and not just assembler addresses,
  //  go to Tools/Options/Debugger/general and set a debugger.


  fpgApplication.Initialize;
  fpgApplication.CreateForm(TMainForm, frm);
  try
    frm.Show;
    fpgApplication.Run;
  finally
    frm.Free;
  end;
end;

begin
  MainProc;
end.

