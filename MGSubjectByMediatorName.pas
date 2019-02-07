Unit MGSubjectByMediatorName;

{$mode objfpc}{$H+}

interface

uses

  Classes, guiMapper, tiObject, tiLog;

//type
//  TSubjectByMediatorName = class(TObject)
//  public
//    Class function SubjectByMediatorName(aMediatorName: String; aObject: TtiObject): TtiObject;
//  end;

function SubjectByMediatorName(aMediatorName: String; aObject: TtiObject): TtiObject;

procedure Log(Msg: String; aSeverity: TtiLogSeverity = lsNormal);

implementation

type
  TzUnitName = class(TObject);

{Class }function {TSubjectByMediatorName.}SubjectByMediatorName(aMediatorName: String; aObject: TtiObject): TtiObject;
const cPHD = 'function SubjectByMediatorName(aMediatorName:String;aObject:TtiObject):TtiObject';
const cPHN = 'SubjectByMediatorName';
Begin
  Log(cPHD);
  result := nil;

  if aObject = nil then
  begin
    Log(cPHN + ': aObject = nil.  Exiting with result = nil.');
    exit;
  end;

  case aMediatorName of

    'Project':
      result := TGMapProject(aObject);

    'Project.Units': 
      result := TGMapProject(aObject).Units;

    'Project.ProjectClasses': 
      result := TGMapProject(aObject).ProjectClasses;

    'Project.ProjectEnums': 
      result := TGMapProject(aObject).ProjectEnums;

    'Project.IncludeFiles': 
      result := TGMapProject(aObject).IncludeFiles;

    'Project.Units.Selected': 
      result := TGMapUnitDef(aObject);

    'Project.Units.Selected.UnitClasses': 
      result := TGMapUnitDef(aObject).UnitClasses;

    'Project.Units.Selected.UnitEnums': 
      result := TGMapUnitDef(aObject).UnitEnums;

    'Project.Units.Selected.UnitReferences': 
      result := TGMapUnitDef(aObject).UnitReferences;

  else
    Log(cPHN + ': No Case Statement found.  result = nil.');
    result := nil;
  end;
end;

procedure Log(Msg: String; aSeverity: TtiLogSeverity);
begin
    tiLog.Log(TzUnitName.UnitName + ': ' + Msg, aSeverity);
end;

end.
