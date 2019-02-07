program ClassDlgTest;

{$mode objfpc}{$H+}
{$define debug}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils,
  fpg_base, fpg_main, fpg_form, frmfpgmgclassdlg, agtidefaultdialogfpg,
  gmapper, typinfo, fpg_Dialogs, frmTester2, frmTester3,
  {%units 'Auto-generated GUI code'}
  fpg_button, fpg_memo
  {%endunits}
  ;

type

  { TMainForm }

  TMainForm = class(TfpgForm)
  private
    {@VFD_HEAD_BEGIN: MainForm}
    btnShowClassDlg: TfpgButton;
    btnSHowModalClassDlg: TfpgButton;
    btnShowDefaultDlg: TfpgButton;
    btnShowModalDefaultDlg: TfpgButton;
    btnfpgBaseDialog: TfpgButton;
    mlog: TfpgMemo;
    btnAsDebug: TfpgButton;
    btnShowTester2: TfpgButton;
    btnShowModalTester2: TfpgButton;
    btnShowTester3: TfpgButton;
    {@VFD_HEAD_END: MainForm}
  public
    fClassMapDef: TGMapClassDef;
    //fClassDlg: TfpgMGClassDlg;
    //fDefaultDlg: TagtiDefaultDialogFPG;
    fPostfix: Integer;
    destructor Destroy; override;

    procedure AfterCreate; override;

    procedure ShowClassDlgClick(Sender: TObject);
    procedure ShowModalClassDlgClick(Sender: TObject);
    procedure ShowDefaultDlgClick(Sender: TObject);
    procedure ShowModalDefaultDlgClick(Sender: TObject);



    procedure btnAsDebugClick(Sender: TObject);
    procedure btnSHowTester2Click(Sender: TObject);
    procedure btnShowModalTester2Click(Sender: TObject);
    procedure ShowTester3Click(Sender: TObject);
    procedure ShowfpgBaseDialogClick(Sender: TObject);

    procedure iLog(msg: String); overload;
    procedure iLog(msg: String; aComp: TComponent); overload;

  end;

{@VFD_NEWFORM_DECL}



{@VFD_NEWFORM_IMPL}

destructor TMainForm.Destroy;
begin
  fClassMapDef.Free;

  inherited Destroy;
end;

procedure TMainForm.AfterCreate;
begin

  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: MainForm}
  Name := 'MainForm';
  SetPosition(808, 186, 404, 436);
  WindowTitle := 'MainForm';
  IconName := '';
  BackGroundColor := $80000001;

  btnShowClassDlg := TfpgButton.Create(self);
  with btnShowClassDlg do
  begin
    Name := 'btnShowClassDlg';
    SetPosition(20, 24, 176, 24);
    Text := 'Show ClassDlg';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 1;
    OnClick := @ShowClassDlgClick;
  end;

  btnSHowModalClassDlg := TfpgButton.Create(self);
  with btnSHowModalClassDlg do
  begin
    Name := 'btnSHowModalClassDlg';
    SetPosition(20, 64, 172, 24);
    Text := 'ShowModal ClassDlg';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 2;
    OnClick := @ShowModalClassDlgClick;
  end;

  btnShowDefaultDlg := TfpgButton.Create(self);
  with btnShowDefaultDlg do
  begin
    Name := 'btnShowDefaultDlg';
    SetPosition(32, 148, 152, 24);
    Text := 'Show Default Dlg';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 3;
    OnClick := @ShowDefaultDlgClick;
  end;

  btnShowModalDefaultDlg := TfpgButton.Create(self);
  with btnShowModalDefaultDlg do
  begin
    Name := 'btnShowModalDefaultDlg';
    SetPosition(36, 188, 148, 24);
    Text := 'ShowModal Default Dlg';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 4;
    OnCLick := @ShowModalDefaultDlgClick;
  end;

  mlog := TfpgMemo.Create(self);
  with mlog do
  begin
    Name := 'mlog';
    SetPosition(0, 286, 404, 150);
    Align := alBottom;
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 5;
  end;

  btnAsDebug := TfpgButton.Create(self);
  with btnAsDebug do
  begin
    Name := 'btnAsDebug';
    SetPosition(232, 72, 136, 24);
    Text := 'ClassDef AsDebug';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 6;
    OnClick := @btnAsDebugClick;
  end;

  btnShowTester2 := TfpgButton.Create(self);
  with btnShowTester2 do
  begin
    Name := 'btnShowTester2';
    SetPosition(236, 156, 136, 24);
    Text := 'Show Tester2';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 7;
    OnClick := @btnshowTester2Click;
  end;

  btnShowModalTester2 := TfpgButton.Create(self);
  with btnShowModalTester2 do
  begin
    Name := 'btnShowModalTester2';
    SetPosition(236, 188, 144, 24);
    Text := 'ShowModal Tester2';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 8;
    OnClick := @btnShowModalTester2Click;
  end;

  btnShowTester3 := TfpgButton.Create(self);
  with btnShowTester3 do
  begin
    Name := 'btnShowTester3';
    SetPosition(236, 236, 148, 24);
    Text := 'Show Tester3';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 9;
    OnClick := @ShowTester3Click;
  end;

  btnfpgBaseDialog := TfpgButton.Create(self);
  with btnfpgBaseDialog do
  begin
    Name := 'btnfpgBaseDialog';
    SetPosition(236, 276, 148, 24);
    Text := 'Show fpgBaseDialog';
    FontDesc := '#Label1';
    ImageName := '';
    ParentShowHint := False;
    TabOrder := 9;
    OnClick := @ShowfpgBaseDialogClick;
  end;

  {@VFD_BODY_END: MainForm}
  {%endregion}

  fClassMapDef := TGMapClassDef.Create;
end;

procedure TMainForm.ShowClassDlgClick(Sender: TObject);
var
  dlg: TfpgMGClassDlg;
  s: String;
begin
  {$ifdef debug}ShowMessage('FClassMapDef: ' + FClassMapDef.AsDebugString());{$endif}

  dlg := TfpgMGClassDlg.Create(self);
  dlg.SetDataOnce(FClassMapDef);
  inc(fPostfix);
  s := 'ClassDlg' + IntToStr(fPostfix);
  dlg.Name := s;
  dlg.WindowTitle := s;
  dlg.Show;
end;

procedure TMainForm.ShowModalClassDlgClick(Sender: TObject);
var
  dlg: TfpgMGClassDlg;
  res: TfpgModalResult;
  pyi: pTypeInfo;
  mr: string;
begin
  dlg := TfpgMGClassDlg.Create(nil);
  dlg.SetDataOnce(FClassMapDef);
  inc(fPostfix);
  dlg.Name := 'ClassDlg' + IntToStr(fPostfix);
  res := dlg.ShowModal;
  pyi := typeinfo(TfpgModalResult);
  mr := typinfo.GetEnumName(pyi, integer(res));

  iLog('ModalResult = ' + mr, dlg);
end;

procedure TMainForm.ShowDefaultDlgClick(Sender: TObject);
var
  dlg: TagtiDefaultDialogFPG;
begin
  dlg := TagtiDefaultDialogFPG.Create(self);
  dlg.SetDataOnce(FClassMapDef);
  inc(fPostfix);
  dlg.Name := 'ClassDlg' + IntToStr(fPostfix);
  dlg.Show;
end;

procedure TMainForm.ShowModalDefaultDlgClick(Sender: TObject);
var
  dlg: TagtiDefaultDialogFPG;
  res: TfpgModalResult;
  pyi: pTypeInfo;
  mr: string;
begin
  dlg := TagtiDefaultDialogFPG.Create(self);
  dlg.SetDataOnce(FClassMapDef);
  inc(fPostfix);
  dlg.Name := 'ClassDlg' + IntToStr(fPostfix);
  res := dlg.ShowModal;
  pyi := typeinfo(TfpgModalResult);
  mr := typinfo.GetEnumName(pyi, integer(res));

  iLog('ModalResult = ' + mr, dlg);
end;

procedure TMainForm.btnAsDebugClick(Sender: TObject);
begin
  ShowMessage(fClassMapDef.AsDebugString);
end;

procedure TMainForm.btnSHowTester2Click(Sender: TObject);
var
  dlg: TTester2;
begin
  dlg := TTester2.Create(self);
  inc(fPostfix);
  dlg.Name := 'TestDlg' + IntToStr(fPostfix);
  dlg.WindowTitle := dlg.Name;
  dlg.Show;
end;

procedure TMainForm.btnShowModalTester2Click(Sender: TObject);
begin
end;

procedure TMainForm.ShowTester3Click(Sender: TObject);
var
  dlg: TTester3;
begin
  dlg := TTester3.Create(self);
  inc(fPostfix);
  dlg.Name := 'Tester3' + IntToStr(fPostfix);
  dlg.WindowTitle := dlg.Name;
  dlg.Show;
end;

procedure TMainForm.ShowfpgBaseDialogClick(Sender: TObject);
var
  Dlg: TfpgBaseDialog;
begin
  Dlg := TfpgBaseDialog.Create(nil);
  dlg.ShowModal;
  dlg.Free;
end;

procedure TMainForm.iLog(msg: String);
begin
  mLog.Lines.Add(msg);
end;

procedure TMainForm.iLog(msg: String; aComp: TComponent);
var
  s: String;
begin
  if aComp <> nil then
  begin
    s := ' Component: ' + aComp.Name + ': ' + aComp.ClassName + ': ';
  end
  else
    s := ' Component: Nil: ';

  iLog(s + msg);
end;


procedure MainProc;
var
  frm: TMainForm;
begin
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

