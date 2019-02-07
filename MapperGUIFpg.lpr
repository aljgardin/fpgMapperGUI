program MapperGUIFpg;

{$mode objfpc}{$H+}

{ TODO : Add comand line params open file. }

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  fpg_main, fpg_Form, mgFpgDialogs,
  MGSubjectByMediatorName, frmFpgMapperGUIMain, frmfpgMGEnumDlg,
  tiLog, tiLogToConsole, tiLogToFile, uMGRegisterDialogs;

const
  cApplicationName = 'TIOPFMapperGUI';

procedure MainProc;
var
  frm: TfpgMapperGUIMainForm;
begin
  fpgApplication.Initialize;


  gLog.RegisterLog(TtiLogToConsole);
  gLog.RegisterLog(TtiLogToFile.CreateWithFileName('.', cApplicationName + '.log', True));


  try
    fpgApplication.CreateForm(TfpgMapperGUIMainForm, frm);
    fpgApplication.MainForm := frm;
    frm.WindowPosition := wpScreenCenter;
    frm.Show;
    fpgApplication.Run;
  finally
    frm.Free;
  end;
end;

{$R *.res}

begin
  MainProc;
end.
