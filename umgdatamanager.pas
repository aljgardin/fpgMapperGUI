unit uMGDataManager;

// A class to hold one projects data.
//  TGMapProject: TMapProject.
//

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Mapper, tiObject, tiOID, GMapper;

type

  { TMGProjectDM }

  {  A class to hold the data for a single project. }
  {  DONOT create individuially.  }
  {  Create through TMGDataManager }

  TMGProjectDM = class(TBaseMapObject)
  private
    FData: TGMapProject;
    FOID: TtiOID;
    procedure SetData(AValue: TGMapProject);
    procedure SetOID(AValue: TtiOID);

  protected

  public
    constructor Create; override;
    destructor Destroy; override;

    property Data: TGMapProject read FData write SetData;
    property OID: TtiOID read FOID write SetOID;  //Read only.

  published

  end;

  { TMGProjectDMList }

  TMGProjectDMList = class(TBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TMGProjectDM; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TMGProjectDM); reintroduce;
  public
    property    Items[AIndex: Integer]: TMGProjectDM read GetItems write SetItems; default;
    function    Add(AObject: TMGProjectDM): Integer; reintroduce;
  end;

  { TMGDataManager }

  TMGDataManager = class(TtiObject)
  private
    FProjectDMs: TMGProjectDMList;
    function GetProjectCount: Integer;
    procedure SetProjectCount(AValue: Integer);
    procedure SetProjectDMs(AValue: TMGProjectDMList);

  protected
    property ProjectDMs: TMGProjectDMList read FProjectDMs write SetProjectDMs;

  public
    constructor Create; override;
    destructor Destroy; override;

    // creates and returns a TGMapProjectData in aProjectData.
    // Returns the OID in Projects.
    //  Confirms setup data by dialog if true.
    //  Only returns valid aProjectData if Dialog Executes ok.
    function NewProjectDM(const aDialog: boolean = true): TMGProjectDM;
    function GetProjectDM(aOID: String): TMGProjectDM;
    function TryGetProjectDM(aOID: String; Var aProjectDM: TMGProjectDM): boolean;

  published
    property ProjectCount: Integer read GetProjectCount write SetProjectCount;

  end;

  var
    //global data manager.  do not created.
    gMGDataManager: TMGDataManager;

implementation

{ TMGProjectDMList }

function TMGProjectDMList.GetItems(i: Integer): TMGProjectDM;
begin
  result := inherited GetItems(i) as TMGProjectDM;
end;

procedure TMGProjectDMList.SetItems(i: Integer; AObject: TMGProjectDM);
begin
  inherited SetItems(i, AObject);
end;

function TMGProjectDMList.Add(AObject: TMGProjectDM): Integer;
begin
  result := inherited Add(AObject);
end;

{ TMGDataManager }

procedure TMGDataManager.SetProjectDMs(AValue: TMGProjectDMList);
begin
  if FProjectDMs = AValue then Exit;
  FProjectDMs := AValue;
end;

function TMGDataManager.GetProjectCount: Integer;
begin
  Result := FProjectDMs.Count;
end;

procedure TMGDataManager.SetProjectCount(AValue: Integer);
begin
  //READ ONLY.
end;

constructor TMGDataManager.Create;
begin
  inherited Create;

  FProjectDMs := TMGProjectDMList.Create;
end;

destructor TMGDataManager.Destroy;
begin
  FProjectDMs.Free;

  inherited Destroy;
end;

function TMGDataManager.NewProjectDM(const aDialog: boolean): TMGProjectDM;
var
  aDM: TMGProjectDM;
//  aDlg: TMGProjectNewDialog;
begin
  aDM := TMGProjectDM.Create;
  FProjectDMs.Add(aDM);

  result := aDM;
end;

function TMGDataManager.GetProjectDM(aOID: String): TMGProjectDM;
begin
  { TODO : NEED TO COMPLETE> }

end;

function TMGDataManager.TryGetProjectDM(aOID: String;
  var aProjectDM: TMGProjectDM): boolean;
begin
  { TODO : NEED TO COMPLETE> }

end;

{ TMGProjectDM }

procedure TMGProjectDM.SetData(AValue: TGMapProject);
begin
  if FData = AValue then Exit;
  FData := AValue;
end;

procedure TMGProjectDM.SetOID(AValue: TtiOID);
begin
  // read only.
  //if FOID = AValue then Exit;
  //FOID := AValue;
end;

constructor TMGProjectDM.Create;
begin
  inherited Create;

  FData := TGMapProject.Create;
end;

destructor TMGProjectDM.Destroy;
begin
  FData.Free;

  inherited destroy;
end;

initialization
  if Not(Assigned(gMGDataManager)) then
    gMGDataManager := TMGDataManager.Create;

finalization
  if Assigned(gMGDataManager) then
    gMGDataManager.Free;

end.

