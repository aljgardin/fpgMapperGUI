unit uMGRegisterDialogs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure RegisterDialogs;

//function AppDialogs: TagtiDialogFactoryDefaultFpgForm;

implementation

uses frmfpgMGEnumDlg, frmfpgmgclassDlg, frmfpgMGIncludesDlg;

var
  FIsRegistered: Boolean;
//  FAppDialogs: TagtiDialogFactoryDefaultFpgForm;

procedure RegisterDialogs;
begin
//  AppDialogs.RegisterDialogClassOFKey(TfpgMGClassDlg, 'TGMapClassDef');
//  AppDialogs.RegisterDialogClassOfKey(TfpgMGEnumDlg, 'TGMapEnum');
//  AppDialogs.RegisterDialogClassOfKey(TfpgMGIncludesDlg, 'TGMapProjectIncludeFile');
end;

//function AppDialogs: TagtiDialogFactoryDefaultFpgForm;
//begin
//  //if Not(Assigned(FAppDialogs)) then
//  //  FAppDialogs := TagtiDialogFactoryDefaultFpgForm.Create;
//  //
//  //result := FAppDialogs;
//end;


initialization
  RegisterDialogs;

Finalization
  //if Assigned(FAppDialogs) then
  //  FAppDialogs.Free;

end.

