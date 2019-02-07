unit TestFormMapper;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, Classes,
  fpg_base, fpg_main,
  tiObject,
  agfpgBaseDialogEditTiopf,
  mapper,
  {%units 'Auto-generated GUI code'}
  fpg_form, fpg_label, fpg_edit
  {%endunits}
  ;

type

  { TTestFormMapper }

  TTestFormMapper = class(TagfpgBaseDialogEditTiopf)
  private
    {@VFD_HEAD_BEGIN: TestFormMapper}
    Label1: TfpgLabel;
    Edit1: TfpgEdit;
    Label2: TfpgLabel;
    Edit2: TfpgEdit;
    {@VFD_HEAD_END: TestFormMapper}
  protected
    procedure SetupMediators; override;

  public
    procedure AfterCreate; override;

  published
    class function DataType: TtiClass; override;
  end;

{@VFD_NEWFORM_DECL}

implementation

{@VFD_NEWFORM_IMPL}

procedure TTestFormMapper.SetupMediators;
begin
  inherited SetupMediators;

  FHelper.SetupPropertyMediator(DataAsType, 'ProjectName', Edit1, 'ProjectName');
  FHelper.SetupPropertyMediator(DataAsType, 'FileName', Edit2, 'FileName');
end;

procedure TTestFormMapper.AfterCreate;
begin
  inherited;
  {%region 'Auto-generated GUI code' -fold}
  {@VFD_BODY_BEGIN: TestFormMapper}
  Name := 'TestFormMapper';
  SetPosition(383, 266, 300, 250);
  WindowTitle := 'TestFormMapper';
  IconName := '';
  BackGroundColor := $80000001;

  Label1 := TfpgLabel.Create(self);
  with Label1 do
  begin
    Name := 'Label1';
    SetPosition(0, 0, 300, 16);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Label';
  end;

  Edit1 := TfpgEdit.Create(self);
  with Edit1 do
  begin
    Name := 'Edit1';
    SetPosition(0, 16, 300, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 2;
    Text := '';
  end;

  Label2 := TfpgLabel.Create(self);
  with Label2 do
  begin
    Name := 'Label2';
    SetPosition(0, 40, 300, 16);
    Align := alTop;
    FontDesc := '#Label1';
    ParentShowHint := False;
    Text := 'Label';
  end;

  Edit2 := TfpgEdit.Create(self);
  with Edit2 do
  begin
    Name := 'Edit2';
    SetPosition(0, 56, 300, 24);
    Align := alTop;
    ExtraHint := '';
    FontDesc := '#Edit1';
    ParentShowHint := False;
    TabOrder := 4;
    Text := '';
  end;

  {@VFD_BODY_END: TestFormMapper}
  {%endregion}
end;

class function TTestFormMapper.DataType: TtiClass;
begin
  //Result := inherited DataType;
  Result := TMapProject;
end;


end.
