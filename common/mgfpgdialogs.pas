unit mgFpgDialogs;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,
  fpg_base,
  fpg_constants,
  fpg_Dialogs,
  fpg_Panel,
  fpg_Label,
  fpg_Edit;

type

  { TMGFileDialogSelect }

  TMGFileDialogSelect = class(TfpgFileDialog)
  private
  protected
  public
    function RunSelectFile: Boolean; overload;
    class function RunSelectFile(var aFileName: String; aWindowTitle: String; aDirectory: String = '.'): Boolean; overload;
end;


procedure fpgLabelPanelResize(Sender: TObject; const aPad: integer = 5);


implementation

uses
  Classes,
  fpg_widget,
  fpg_utils,
  Windows   // used by File Dialog & Select Dir Dialog
  ;

procedure fpgLabelPanelResize(Sender: TObject; const aPad: integer = 5);
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
    aPanel.Height := ht + aPad;
end;


function TMGFileDialogSelect.RunSelectFile: Boolean;
var
  sdir: string;
  fname: string;
begin
  FOpenMode := True;
  sdir := fpgExtractFileDir(FileName);
  if sdir = '' then
    sdir := '.';

  SetCurrentDirectory(sdir);
  fname := fpgExtractFileName(FileName);

  if not HighlightFile(fname) then
    edFilename.Text := fname;

  WindowTitle     := 'Select a File.';    //rsOpenAFile;
  btnOK.ImageName := 'stdimg.open';   // Do NOT localize
  btnOK.Text      := 'Select';    //rsOpen;

  if ShowModal = mrOK then
    Result := True
  else
    Result := False;
end;

class function TMGFileDialogSelect.RunSelectFile(var aFileName: String;
  aWindowTitle: String; aDirectory: String): Boolean;
var
  dlg: TMGFileDialogSelect;
begin
  //property    BackgroundColor;
  //property    FullScreen;
  //property    Height;
  //property    Hint;
  //property    IconName;
  //property    Left;
  //property    MaxHeight;
  //property    MaxWidth;
  //property    MinHeight;
  //property    MinWidth;
  //property    ModalResult;
  //property    ShowHint;
  //property    Sizeable;
  //property    TextColor;
  //property    Top;
  //property    Width;
  //property    WindowPosition;
  //property    WindowState;
  //property    WindowTitle;

  //property    Filter: string read FFilter write SetFilter;
  //property    FontDesc: string read GetFontDesc write SetFontDesc;
  //property    InitialDir: string read FInitialDir write SetInitialDir;
  //property    ShowHidden: boolean read GetShowHidden write SetShowHidden;

  result := false;
  try
    dlg := TMGFileDialogSelect.Create(nil);
    dlg.WindowTitle := aWindowTitle;
    if FileExists(aFilename) then
      dlg.FileName := aFileName;
    if DirectoryExists(aDirectory) then
      dlg.InitialDir := aDirectory;

    if dlg.RunSelectFile then
    begin
      aFilename := dlg.FileName;
      result := true;
    end;
  finally
    dlg.Free;
  end;
end;

end.

