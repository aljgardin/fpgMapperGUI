unit guimapper;

//  This unit has been adapted from:
//    mapper.pas in package laz_timapper.lpk from TIOPF.
//  It has been restructured to work more easily in a mediator GUI way.
//


{$IFDEF FPC}
  {$mode objfpc}{$H+}
{$ENDIF}

{-g}

interface

uses
  Classes
  ,SysUtils
  ,variants
  ,tiObject
  ,tiRTTI
  ,typinfo
  ,tiBaseObject
  ,mapper
  ;

type

  // -----------------------------------------------------------------
  //  Foward Declares
  // -----------------------------------------------------------------

  //TBaseMapObject = class;  We will use TBaseMapObject in Mapper.pas.
  TgBaseMapObjectList = class;
  TgMapUnitDef = class;
  TgMapUnitDefList = class;
  TgMapEnum = class;
  TgMapEnumList = class;
  TgMapClassDef = class;
  TgMapClassDefList = class;
  TgClassMapping = class;

  //New:
  TgMapProjectIncludeFile = class;
  TgMapProjectIncludeFileList = class;
  TgMapUnitReference = class;
  TgMapUnitReferenceList = class;
  TgMapStringlistUpdater = class;

  // -----------------------------------------------------------------
  //  Events Signatures
  // -----------------------------------------------------------------

  //Use Below from Mapper.pas:
  //TOnWriteUnit = procedure(AUnitDef: TMapUnitDef) of object;
  //TOnWriteClassIntf = procedure(AClassDef: TMapClassDef) of object;
  //TOnWriteEnum = procedure(AEnum: TMapEnum) of object;
  //TOnWriteMapping = procedure(AClassDef: TMapClassDef; AMapping: TClassMapping) of object;

  // -----------------------------------------------------------------
  //  Enumerations
  // -----------------------------------------------------------------

  //Use Below from Mapper.pas:
  //{: Type of class property. }
  //TMapPropType = (ptString, ptAnsiString, ptDouble, ptSingle, ptCurrency, ptInteger, ptInt64,
  //  ptDateTime, ptBoolean, ptEnum, ptEnumSet, ptStream);
  //
  //{: Type of class definition to create. }
  //TClassDefType = (dtCreate, dtReference);
  //
  //{: Filter type to use when filtering objects. }
  //TFilterType = (ftEqual, ftNotEqual, ftGreater, ftGreaterOrEqual, ftLess, ftLessOrEqual,
  //  ftLike, ftNotLike, ftStartingWith, ftNotEmpty);
  //
  //{: Indicates an objects state. }
  //TORMObjectState = (osUnchanged, osChanged, osDeleted, osCreated);
  //
  //{: Indicates the state of an object list. }
  //TORMListState = (lsEmpty, lsPopulated);
  //
  //{: Describes the type of OID to use for object. }
  //TOIDType = (otString, otInt);
  //
  //{: Describes how enumeratated types should be handled. }
  //TEnumType = (etInt, etString);
  //
  //{: Describes validators types. }
  //TValidatorType = (vtRequired, vtGreater, vtGreaterEqual, vtLess, vtLessEqual,
  //  vtNotEqual, vtRegExp);


  // -----------------------------------------------------------------
  //  Method Objects
  // -----------------------------------------------------------------

  //Use Below from Mapper.pas:
  //TGetValidatorErrorString = function(const AValType: TValidatorType): string;

  // -----------------------------------------------------------------
  //  Class Objects
  // -----------------------------------------------------------------

  //Use Below from Mapper.pas:
  //{: Base Mapper Object. }
  //{$M+}
  //TBaseMapObject = class(TtiObject)
  //end;
  //{$M-}

  //New:
  TgBaseMapObjectClass = class of TBaseMapObject;

  { TgBaseMapObjectList }

  TgBaseMapObjectList = class(TtiObjectList)
  protected
    function    GetItems(i: Integer): TBaseMapObject; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TBaseMapObject); reintroduce;

  public
    property    Items[AIndex: Integer]: TBaseMapObject read GetItems write SetItems; default;
    function    Add(AObject: TBaseMapObject): Integer; reintroduce;

    {: Add a New object to the list.  }
    {: BaseItemtype must be set in overriden Create or will return a TBaseMapObject.  }
    function    Add(out IDX: Integer): TtiObject; virtual;
    function    AddNew(out IDX: Integer): TtiObject; virtual;
    //////TtiObjectList. AddNew().........
  published
    // Override in descendents:
    class function BaseItemType: TClass; virtual;
  end;

  TgBaseMapObjectListClass = Class Of TgBaseMapObjectList;

  {: Base project class. }

  { TgMapProject }

  TgMapProject = class(TBaseMapObject)
  private
    FBaseDirectory: string;
    FBeginEndTabs: integer;
    FEnumType: TEnumType;
    FIncludeFiles: TgMapProjectIncludeFileList;
    FIncludes: TStringList;
    FFileName: string;
    FMaxEditorCodeWidth: integer;
    FOrigOutDirectory: string;
    FOutputDirectory: string;
    FProjectClasses: TgMapClassDefList;
    FProjectEnums: TgMapEnumList;
    FProjectName: string;
    FTabSpaces: integer;
    FUnits: TgMapUnitDefList;
    FVisibilityTabs: integer;
    procedure SetBaseDirectory(const AValue: string);
    procedure SetBeginEndTabs(const AValue: integer);
    procedure SetEnumType(const AValue: TEnumType);
    procedure SetFileName(const AValue: string);
    procedure SetIncludeFiles(AValue: TgMapProjectIncludeFileList);
    procedure SetMaxEditorCodeWidth(const AValue: integer);
    procedure SetOrigOutDirectory(const AValue: string);
    procedure SetOutputDirectory(const AValue: string);
    procedure SetProjectClasses(const AValue: TgMapClassDefList);
    procedure SetProjectName(const AValue: string);
    procedure SetTabSpaces(const AValue: integer);
    procedure SetVisibilityTabs(const AValue: integer);
  protected
    FStringListUpdater: TgMapStringlistUpdater;
    // When Does the Includes: TStringlist Change?
    procedure OnIncludesChange(AObject: TObject);
  public
    constructor Create; override;
    destructor  Destroy; override;
    function    FindEnumForPropName(const AUnitName: string; const AClassName: string; const APropName: string): TgMapEnum;
    function    HasCustomSelects: boolean;
    procedure   ClearAll;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapProject; reintroduce;

//  published
    // object properties Changed to Published
    property    Units: TgMapUnitDefList read FUnits;
    property    ProjectClasses: TgMapClassDefList read FProjectClasses write SetProjectClasses;
    property    ProjectEnums: TgMapEnumList read FProjectEnums;

  published
    property    FileName: string read FFileName write SetFileName;
    property    ProjectName: string read FProjectName write SetProjectName;
    property    Includes: TStringList read FIncludes;
    property    OrigOutDirectory: string read FOrigOutDirectory write SetOrigOutDirectory;
    property    OutputDirectory: string read FOutputDirectory write SetOutputDirectory;
    property    BaseDirectory: string read FBaseDirectory write SetBaseDirectory;
    property    TabSpaces: integer read FTabSpaces write SetTabSpaces;
    property    BeginEndTabs: integer read FBeginEndTabs write SetBeginEndTabs;
    property    VisibilityTabs: integer read FVisibilityTabs write SetVisibilityTabs;
    property    MaxEditorCodeWidth: integer read FMaxEditorCodeWidth write SetMaxEditorCodeWidth;
    property    EnumType: TEnumType read FEnumType write SetEnumType;
    // object properties
    property    IncludeFiles: TgMapProjectIncludeFileList read FIncludeFiles write SetIncludeFiles;
  end;


  { TgMapProjectList }

  TgMapProjectList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapProject; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapProject); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapProject read GetItems write SetItems; default;
    function    Add(AObject: TgMapProject): Integer; reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  { TgMapConnectionDef }

  TgMapConnectionDef = class(TBaseMapObject)
  private
    FConnType: string;
    FDataSource: string;
    FHost: string;
    FParams: TStringList;
    procedure SetConnType(const AValue: string);
    procedure SetDataSource(const AValue: string);
    procedure SetHost(const AValue: string);
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapConnectionDef; reintroduce;

  published
    property    ConnType: string read FConnType write SetConnType;
    property    Host: string read FHost write SetHost;
    property    DataSource: string read FDataSource write SetDataSource;
    { TODO : Add ConnectionParams TtiObject. }
    property    Params: TStringList read FParams;
  end;


  { TgMapConnectionDefList }

  TgMapConnectionDefList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapConnectionDef; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapConnectionDef); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapConnectionDef read GetItems write SetItems; default;
    function    Add(AObject: TgMapConnectionDef): Integer; reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Represent a pascal Enumerated type value.  ie: bsNone, bsSolid, etc. }

  { TgMapEnumValue }

  TgMapEnumValue = class(TBaseMapObject)
  private
    FEnumValue: integer;
    FEnumValueName: string;
    procedure SetEnumValue(const AValue: integer);
    procedure SetEnumValueName(const AValue: string);
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapEnumValue; reintroduce;
  published
    property    EnumValueName: string read FEnumValueName write SetEnumValueName;
    property    EnumValue: integer read FEnumValue write SetEnumValue;
  end;


  { TgMapEnumValueList }

  TgMapEnumValueList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapEnumValue; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapEnumValue); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapEnumValue read GetItems write SetItems; default;
    function    Add(AObject: TgMapEnumValue): Integer; reintroduce; overload;
    function    Add(const AName: string; const AValue: integer = -1): integer; overload;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Represents an enumerated type. }
  TgMapEnum = class(TBaseMapObject)
  private
    FEnumName: string;
    FEnumSetName: string;
    FValues: TgMapEnumValueList;
    procedure SetEnumName(const AValue: string);
    procedure SetEnumSetName(const AValue: string);
    procedure SetValues(const AValue: TgMapEnumValueList);
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapEnum; reintroduce;

//  published
    //Values changed to published.
    property    Values: TgMapEnumValueList read FValues write SetValues;

  published
    property    EnumSetName: String read FEnumSetName write SetEnumSetName;
    property    EnumName: string read FEnumName write SetEnumName;
  end;


  { TgMapEnumList }

  TgMapEnumList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapEnum; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapEnum); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapEnum read GetItems write SetItems; default;
    function    Add(AObject: TgMapEnum): Integer; reintroduce;
    function    FindByName(const AName: string): TgMapEnum;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Stores information about a class property. }

  { TgMapClassProp }

  TgMapClassProp = class(TBaseMapObject)
  private
    FIsReadOnly: boolean;
    FName: string;
    FPropertyType: TMapPropType;
    FPropTypeName: string;
    FVirtualGetter: boolean;
    procedure SetIsReadOnly(const AValue: boolean);
    procedure SetPropName(const AValue: string);
    procedure SetPropType(const AValue: TMapPropType);
    procedure SetPropTypeName(const AValue: string);
    procedure SetVirtualGetter(AValue: boolean);
  public
    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapClassProp; reintroduce;

  published
    property    Name: string read FName write SetPropName;
    property    PropertyType: TMapPropType read FPropertyType write SetPropType;
    property    PropTypeName: string read FPropTypeName write SetPropTypeName;
    property    IsReadOnly: boolean read FIsReadOnly write SetIsReadOnly;
    property    VirtualGetter: boolean read FVirtualGetter write SetVirtualGetter;
  end;


  { TgMapClassPropList }

  TgMapClassPropList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapClassProp; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapClassProp); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapClassProp read GetItems write SetItems; default;
    function    Add(AObject: TgMapClassProp): Integer; reintroduce; overload;
    function    Add(const AName: string; const APropType: TMapPropType): integer; overload;
    function    FindByName(const AName: string): TgMapClassProp;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Stores info about the mapping between a class property and its corresponding database field name. }

  { TgPropMapping }

  TgPropMapping = class(TBaseMapObject)
  private
    FFieldName: string;
    FPropName: string;
    FPropertyType: TMapPropType;
    FPropertyGetter: String;
    FPropertySetter: String;
    FPropertyAccessorsAreAbstract: Boolean;
    procedure SetFieldName(const AValue: string);
    procedure SetPropName(const AValue: string);
    procedure SetPropType(const AValue: TMapPropType);
    procedure SetPropertyGetter(const AValue: string);
    procedure SetPropertySetter(const AValue: string);
  public
    function    IsValid(const AErrors: TtiObjectErrors): Boolean; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgPropMapping; reintroduce;
  published
    property    PropName: string read FPropName write SetPropName;
    property    FieldName: string read FFieldName write SetFieldName;
    property    PropertyType: TMapPropType read FPropertyType write SetPropType;
    property    PropertyGetter: string read FPropertyGetter write SetPropertyGetter;
    property    PropertySetter: string read FPropertySetter write SetPropertySetter;
    property    PropertyAccessorsAreAbstract: Boolean read FPropertyAccessorsAreAbstract write FPropertyAccessorsAreAbstract;
  end;


  { TgPropMappingList }

  TgPropMappingList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgPropMapping; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgPropMapping); reintroduce;
  public
    property    Items[AIndex: Integer]: TgPropMapping read GetItems write SetItems; default;
    function    Add(AObject: TgPropMapping): Integer; reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Stores information about the class <--> database mapping such as table name.
    Contains a TPropMappingList. }

  { TgClassMapping }

  TgClassMapping = class(TBaseMapObject)
  private
    FOIDType: TOIDType;
    FPKField: string;
    FPKName: string;
    FPropMappings: TgPropMappingList;
    FTableName: string;
    procedure SetOIDType(const AValue: TOIDType);
    procedure SetPKField(const AValue: string);
    procedure SetPKName(const AValue: string);
    procedure SetTableName(const AValue: string);
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgClassMapping; reintroduce;

  published
    property    TableName: string read FTableName write SetTableName;
    property    PKName: string read FPKName write SetPKName;
    property    PKField: string read FPKField write SetPKField;
    property    OIDType: TOIDType read FOIDType write SetOIDType;
    //Object Properties:
    property    PropMappings: TgPropMappingList read FPropMappings;

  end;


  {: Represent a parameter defintion in a selection.  Translates to the parameters of the
    method that will be created in the object list class. }

  { TgSelectParam }

  TgSelectParam = class(TBaseMapObject)
  private
    FParamName: string;
    FParamType: TMapPropType;
    FParamTypeName: string;
    FPassBy: string;
    FSQLParamName: string;
    FTypeName: string;
    FValue: Variant;
    procedure SetParamName(const AValue: string);
    procedure SetParamType(const AValue: TMapPropType);
    procedure SetParamTypeName(const AValue: string);
    procedure SetPassBy(const AValue: string);
    procedure SetSQLParamName(const AValue: string);
    procedure SetTypeName(const AValue: string);
    procedure SetValue(const AValue: Variant);

  public
    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgSelectParam; reintroduce;

  published
    property    ParamName: string read FParamName write SetParamName;
    property    SQLParamName: string read FSQLParamName write SetSQLParamName;
    property    ParamType: TMapPropType read FParamType write SetParamType;
    property    ParamTypeName: string read FParamTypeName write SetParamTypeName;
    property    TypeName: string read FTypeName write SetTypeName;
    property    PassBy: string read FPassBy write SetPassBy;
    property    Value: Variant read FValue write SetValue;
  end;


  { TgSelectParamList }

  TgSelectParamList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgSelectParam; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgSelectParam); reintroduce;
  public
    property    Items[AIndex: Integer]: TgSelectParam read GetItems write SetItems; default;
    function    Add(AObject: TgSelectParam): Integer; reintroduce;
    function    FindByName(const AName: string): TgSelectParam;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Represents a class section.  Contains SQL and name.   }

  { TgClassMappingSelect }

  TgClassMappingSelect = class(TBaseMapObject)
  private
    FName: string;
    FParams: TgSelectParamList;
    FSQL: string;
    procedure SetName(const AValue: string);
    procedure SetSQL(const Value: string);
  protected
    function    GetCaption: string; override;
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgClassMappingSelect; reintroduce;

//  published
    //Changed params to published
    property    Params: TgSelectParamList read FParams;

  published
    property    Name: string read FName write SetName;
    property    SQL: string read FSQL write SetSQL;
  end;


  { TgClassMappingSelectList }

  TgClassMappingSelectList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgClassMappingSelect; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgClassMappingSelect); reintroduce;
  public
    property    Items[AIndex: Integer]: TgClassMappingSelect read GetItems write SetItems; default;
    function    Add(AObject: TgClassMappingSelect): Integer; reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  { TgClassMappingList }

  TgClassMappingList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgClassMapping; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgClassMapping); reintroduce;
  public
    property    Items[AIndex: Integer]: TgClassMapping read GetItems write SetItems; default;
    function    Add(AObject: TgClassMapping): Integer; reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  { TgFilterDef }

  TgFilterDef = class(TBaseMapObject)
  private
    FField: String;
    FFilterType: TFilterType;
    procedure SetField(const AValue: String);
    procedure SetFilterType(const AValue: TFilterType);
  public
    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgFilterDef; reintroduce;

//  published
    //Changed FilterType, Field to published
    property    FilterType: TFilterType read FFilterType write SetFilterType;
    property    Field: String read FField write SetField;
  end;


  { TgFilterDefList }

  TgFilterDefList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgFilterDef; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgFilterDef); reintroduce;
  public
    property    Items[AIndex: Integer]: TgFilterDef read GetItems write SetItems; default;
    function    Add(AObject: TgFilterDef): Integer; reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  {: Validators get written into the class object's IsValid override. }

  { TgMapValidator }

  TgMapValidator = class(TBaseMapObject)
  private
    FClassProp: string;
    FValidatorType: TValidatorType;
    FValue: variant;
    procedure SetClassProp(const AValue: string);
    procedure SetValidatorType(const AValue: TValidatorType);
    procedure SetValue(const AValue: variant);

  public
    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapValidator; reintroduce;

  published
    property    ValidatorType: TValidatorType read FValidatorType write SetValidatorType;
    property    ClassProp : string read FClassProp write SetClassProp;
    property    Value: variant read FValue write SetValue;
  end;


  {: List of TValidator objects. }

  { TgMapValidatorList }

  TgMapValidatorList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: integer): TgMapValidator; reintroduce;
    procedure   SetItems(i: integer; const AValue: TgMapValidator); reintroduce;
  public
    property    Items[i:integer] : TgMapValidator read GetItems write SetItems;
    procedure   Add(AObject : TgMapValidator); reintroduce;

  published
    class function BaseItemType: TClass; override;
  end;


  { TgMapClassDef }

  TgMapClassDef = class(TBaseMapObject)
  private
    FAutoCreateBase: boolean;
    FAutoCreateListClass: boolean;
    FAutoMap: boolean;
    FBaseClassName: string;
    FBaseClassParent: string;
    FBaseListClassParent: string;
    FBaseUnitName: string;
    FClassMapping: TgClassMapping;
    FClassProps: TgMapClassPropList;
    FCrud: string;
    FDefType: TClassDefType;
    FForwardDeclare: boolean;
    FListSavesDatabaseName: boolean;
    FNotifyObserversOfPropertyChanges: boolean;
    FORMClassName: string;
    FSelections: TgClassMappingSelectList;
    FValidators: TgMapValidatorList;
    procedure SetAutoCreateBase(const AValue: boolean);
    procedure SetAutoCreateListClass(const AValue: boolean);
    procedure SetAutoMap(const AValue: boolean);
    procedure SetBaseClassName(const AValue: string);
    procedure SetBaseClassParent(const AValue: string);
    procedure SetBaseListClassParent(AValue: string);
    procedure SetBaseUnitName(const AValue: string);
    procedure SetClassProps(const AValue: TgMapClassPropList);
    procedure SetCrud(const AValue: string);
    procedure SetDefType(const AValue: TClassDefType);
    procedure SetForwardDeclare(const AValue: boolean);
    procedure SetListSavesDatabaseName(const AValue: boolean);
    procedure SetNotifyObserversOfPropertyChanges(const AValue: boolean);
    procedure SetORMClassName(const AValue: string);
  public
    constructor Create; override;
    destructor  Destroy; override;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapClassDef; reintroduce;

//  Published
    //Changed object properties to published.
    // Object Props
    property    ClassProps: TgMapClassPropList read FClassProps write SetClassProps;
    property    ClassMapping: TgClassMapping read FClassMapping;
    property    Selections: TgClassMappingSelectList read FSelections;
    property    Validators: TgMapValidatorList read FValidators;

  published
    property    AutoCreateBase: boolean read FAutoCreateBase write SetAutoCreateBase;
    property    AutoCreateListClass: boolean read FAutoCreateListClass write SetAutoCreateListClass;
    property    AutoMap: Boolean read FAutoMap write SetAutoMap;
    property    BaseClassName: string read FBaseClassName write SetBaseClassName;
    property    BaseClassParent: string read FBaseClassParent write SetBaseClassParent;
    property    BaseListClassParent: string read FBaseListClassParent write SetBaseListClassParent;
    property    BaseUnitName: string read FBaseUnitName write SetBaseUnitName;
    property    Crud: string read FCrud write SetCrud;
    property    DefType: TClassDefType read FDefType write SetDefType;
    property    ForwardDeclare: boolean read FForwardDeclare write SetForwardDeclare;
    property    ListSavesDatabaseName: boolean read FListSavesDatabaseName write SetListSavesDatabaseName;
    property    ORMClassName: string read FORMClassName write SetORMClassName;
    property    NotifyObserversOfPropertyChanges: boolean read FNotifyObserversOfPropertyChanges write SetNotifyObserversOfPropertyChanges default False;
  end;


  { TgMapClassDefList }

  TgMapClassDefList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapClassDef; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapClassDef); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapClassDef read GetItems write SetItems; default;
    function    Add(AObject: TgMapClassDef): Integer; reintroduce;
    function    FindByName(const AName: string): TgMapClassDef;

  published
    class function BaseItemType: TClass; override;
  end;


  { TgMapUnitDef }

  TgMapUnitDef = class(TBaseMapObject)
  private
    FReferences: TStringList;
    FUnitClasses: TgMapClassDefList;
    FUnitEnums: TgMapEnumList;
    FName: string;
    FUnitReferences: TgMapUnitReferenceList;
    procedure SetUnitName(const AValue: string);
    procedure SetUnitReferences(AValue: TgMapUnitReferenceList);
  protected
    FStringListUpdater: TgMapStringlistUpdater;
    procedure OnReferencesChange(AObject: TObject);
  public
    constructor Create; override;
    destructor  Destroy; override;
    function    HasValidators: boolean;

    procedure   AssignClassProps(ASource: TtiObject); override;
    function    Clone : TgMapUnitDef; reintroduce;
  published
    property    Name: string read FName write SetUnitName;
    // Object properties
    property    UnitClasses: TgMapClassDefList read FUnitClasses;
    property    UnitEnums: TgMapEnumList read FUnitEnums;
    property    References: TStringList read FReferences;

    property    UnitReferences: TgMapUnitReferenceList read FUnitReferences write SetUnitReferences;
  end;


  { TgMapUnitDefList }

  TgMapUnitDefList = class(TgBaseMapObjectList)
  protected
    function    GetItems(i: Integer): TgMapUnitDef; reintroduce;
    procedure   SetItems(i: Integer;  AObject: TgMapUnitDef); reintroduce;
  public
    property    Items[AIndex: Integer]: TgMapUnitDef read GetItems write SetItems; default;
    function    Add(AObject: TgMapUnitDef): Integer; reintroduce;
    function    FindByName(const AName: string): TgMapUnitDef;
    function NameExists(const AName: String): Boolean;
  published
    class function BaseItemType: TClass; override;
  end;

  //Use Below from Mapper.pas:
  //{: Class of TMapSchemaReader. }
  //TMapSchemaReader = class;
  //TMapSchemaReaderClass = class of TMapSchemaReader;

  //Use Below from Mapper.pas:
  //{: Abstract class used to read xml schema file into TMapProject. }
  //TMapSchemaReader = class(TBaseMapObject)
  //public
  //  procedure   ReadSchema(AProject: TgMapProject; const AFileName: string); overload; virtual; abstract;
  //  procedure   WriteAll; virtual; abstract;
  //end;

  //Use Below from Mapper.pas:
  //TMapSchemaWriter = class(TBaseMapObject)
  //private
  //  FCurrentIndent: integer;
  //  FProject: TgMapProject;
  //  procedure SetCurrentIndent(const AValue: integer);
  //  procedure SetOnWriteClass(const AValue: TOnWriteClassIntf);
  //  procedure SetOnWriteEnum(const AValue: TOnWriteEnum);
  //  procedure SetOnWriteMapping(const AValue: TOnWriteMapping);
  //  procedure SetOnWriteUnit(const AValue: TOnWriteUnit);
  //  procedure SetProject(const AValue: TgMapProject);
  //protected
  //  FOnWriteClass: TOnWriteClassIntf;
  //  FOnWriteEnum: TOnWriteEnum;
  //  FOnWriteMapping: TOnWriteMapping;
  //  FOnWriteUnit: TOnWriteUnit;
  //  property    CurrentIndent: integer read FCurrentIndent write SetCurrentIndent;
  //  function    TabToSpaces(const ANumTabs: integer): string;
  //  procedure   IncTab(const ANum: integer = 1);
  //  procedure   DecTab;
  //  procedure   WriteLine(const AText: string; AList: TStringList);
  //  procedure   WriteBreak(AList: TStringList);
  //  property    Project: TgMapProject read FProject write SetProject;
  //public
  //  constructor Create(AProject: TgMapProject); reintroduce; virtual;
  //  destructor  Destroy; override;
  //  procedure   WriteProject(const ADirectory: String); overload; virtual; abstract;
  //  procedure   WriteProject(const ADirectory: string; ASL: TStringList); overload; virtual; abstract;
  //  // Events
  //  property    OnWriteClass: TOnWriteClassIntf read FOnWriteClass write SetOnWriteClass;
  //  property    OnWriteUnit: TOnWriteUnit read FOnWriteUnit write SetOnWriteUnit;
  //  property    OnWriteEnum: TOnWriteEnum read FOnWriteEnum write SetOnWriteEnum;
  //  property    OnWriteMapping: TOnWriteMapping read FOnWriteMapping write SetOnWriteMapping;
  //end;


  //Use Below from Mapper.pas:
  //{: TtiFilteredObjectList descendant with extra properties to facilitate custom searching/queries. }
  //TtiMappedFilteredObjectList = class(TtiFilteredObjectList)
  //private
  //  FEnumType: TEnumType;
  //  FObjClass: TtiObjectClass;
  //  FParams: TgSelectParamList;
  //  FSQL: String;
  //  procedure SetEnumType(const AValue: TEnumType);
  //  procedure SetObjClass(const AValue: TtiObjectClass);
  //  procedure SetSQL(const AValue: String);
  //public
  //  constructor Create; override;
  //  destructor  Destroy; override;
  //  //function IsValid(const AErrors: TtiObjectErrors): boolean; overload; override;
  //  property    SQL: String read FSQL write SetSQL;
  //  property    ObjClass: TtiObjectClass read FObjClass write SetObjClass;
  //  property    EnumType: TEnumType read FEnumType write SetEnumType;
  //  property    Params: TgSelectParamList read FParams;
  //  procedure   AddParam(const AName: string; const ASQLParamName: string; AParamType: TMapPropType; AValue: Variant);
  //end;


  //Use Below from Mapper.pas:
  //{: List read Visitor with parameters for use as a generic list visitor.}
  //TtiMapParameterListReadVisitor = class(TtiVisitorSelect)
  //private
  //  FClassDef: TgMapClassDef;
  //  FEnumType: TEnumType;
  //  FObjClass: TtiObjectClass;
  //  FSQL: string;
  //  procedure SetClassDef(const AValue: TgMapClassDef);
  //  procedure SetEnumType(const AValue: TEnumType);
  //  procedure SetObjClass(const AValue: TtiObjectClass);
  //  procedure SetSQL(const AValue: string);
  //protected
  //  FParams: TgSelectParamList;
  //  procedure   Init; override;
  //  procedure   SetupParams; override;
  //public
  //  constructor Create; override;
  //  destructor  Destroy; override;
  //  property    SQL: string read FSQL write SetSQL;
  //  property    ClassDef: TgMapClassDef read FClassDef write SetClassDef;
  //  property    ObjClass: TtiObjectClass read FObjClass write SetObjClass;
  //  property    EnumType: TEnumType read FEnumType write SetEnumType;
  //end;


  //Use Below from Mapper.pas:
  //{: Class for creating validator error strings. }
  //TValidatorStringGenerator = class(TtiObject)
  //public
  //  class function GetValueAsString(AObject: TtiObject; const APropName: string; AValue: Variant): string;
  //  class function CreateRequiredValidatorMsg(AObject: TtiObject; const APropName: string): string; virtual;
  //  class function CreateGreaterValidatorMsg(AObject: TtiObject; const APropName: string; AValue: Variant): string; virtual;
  //  class function CreateGreaterOrEqualValidatorMsg(AObject: TtiObject; const APropName: string; AValue: Variant): string; virtual;
  //  class function CreateLessThanValidatorMsg(AObject: TtiObject; const APropName: string; AValue: Variant): string; virtual;
  //  class function CreateLessThanOrEqualValidatorMsg(AObject: TtiObject; const APropName: string; AValue: Variant): string; virtual;
  //  class function CreateNotEqualToValidatorMsg(AObject: TtiObject; const APropName: string; AValue: Variant): string; virtual;
  //end;


  //Use Below from Mapper.pas:
  //{: Class of  }
  //TValidatorStringGeneratorClass = class of TValidatorStringGenerator;


  { New AJG: TMapProjectIncludeFile: A mediator friendly object for an Include File Name. }

   TgMapProjectIncludeFile = class(TBaseMapObject)
   protected
     FIncludeFilename: String;
     procedure SetIncludeFilename(const AValue: String); virtual;
   public
     function Clone : TgMapProjectIncludeFile; reintroduce;
   published
     property    IncludeFilename: String read FIncludeFilename write SetIncludeFilename;
   end;

   { TgMapProjectIncludeFileList }

   TgMapProjectIncludeFileList = class(TgBaseMapObjectList)
   protected
     procedure SetItems(i: integer; const AObject: TgMapProjectIncludeFile); reintroduce;
     function GetItems(i: integer): TgMapProjectIncludeFile; reintroduce;
   public
     property Items[i: integer]: TgMapProjectIncludeFile read GetItems write SetItems;
     procedure Add(AObject: TgMapProjectIncludeFile); reintroduce;
     function Clone : TgMapProjectIncludeFileList; reintroduce;
     function FindByIncludeFileName(Const AName: string): TgMapProjectIncludeFile;

   published
     class function BaseItemType: TClass; override;
   end;

   { TgMapUnitReference:  A mediator friendly object for a Unit Reference.}

   TgMapUnitReference = class(TBaseMapObject)
   protected
     FUnitReference: string;
     procedure SetReference(const AValue: string); virtual;
   public
     function Clone: TgMapUnitReference; reintroduce;
   published
     property UnitReference: string read FUnitReference write SetReference;
   end;

   { TgMapUnitReferenceList }

   TgMapUnitReferenceList = class(TgBaseMapObjectList)
   protected
     procedure SetItems(i: integer; const AObject: TgMapUnitReference); reintroduce;
     function GetItems(i: integer): TgMapUnitReference; reintroduce;
   public
     property Items[i: integer]: TgMapUnitReference read GetItems write SetItems;
     procedure Add(AObject: TgMapUnitReference); reintroduce;
     function Clone : TgMapUnitReferenceList; reintroduce;
     function FindByUnitReference(Const AName: string): TgMapUnitReference;

   published
     class function BaseItemType: TClass; override;
   end;


  { TgMapStringlistUpdater }

  // A class to be notified of Changes to a:
  //   TMapProjectIncludeFileList;
  //   TMapUnitReferenceList. Or TtiObjectList.
  //   Stringlist: TStringlist is the stringlist to update.
  //    FPropName is the Property Name of FtiObjectList
  TgMapStringlistUpdater = class(TtiObject)
  private

  protected
    FtiObjectList: TgBaseMapObjectList;
    FStringList: TStringList;
    FPropName: String;
    procedure AttachToList;

  public
    //  aStringlist is the stringlist to update.
    //  atiObjectList: TtiObjectList to Sync with.
    //  aPropName is the Property name of the tiObjectList.Item String property to
    //    Update with.
    Constructor Create(aStringList: TStringList; atiObjectList: TgBaseMapObjectList; aPropName: String); overload; virtual;
    Destructor Destroy; override;

    procedure   Update(ASubject: TtiObject); Override;
  end;


  //Use Below from Mapper.pas:
  //procedure RegisterMappings;
  //
  //// Misc global methods.
  //{: Set the class used for reading and writing schema projects from and to XML. }
  //procedure gSetSchemaReaderClass(const AClass: TMapSchemaReaderClass);
  //{: Set the class of the default schema reader. }
  //function  gGetSchemaReaderClass: TMapSchemaReaderClass;
  //{: Converts AString into a TClassDefType. }
  //function  gStrToClassDefType(const AString: String): TClassDefType;
  //{: Converts AString into corresponding TMapPropType. }
  //function  gStrToPropType(const AString: string): TMapPropType;
  //{: Converts a TMapPropType into its streaming evquilv. }
  //function  gPropTypeToStr(const APropType: TMapPropType): string;
  //{: Finds a TtiAttrColMap given the AClassName.  Built in function uses the TClass instead of string. }
  //function  gFindAttrMap(const AClassName: string; const AAttrName: string): TtiAttrColMap;
  //{: Converts AString into corresponding TValidatorType. }
  //function  gStrToValType(const AString: string): TValidatorType;
  //{: Converts AValType into its string equiv. }
  //function  gValTypeToStr(const AValType: TValidatorType): string;
  //{: Returns the absolute path of Source Path given Relative path. }
  //function  GetAbsolutePath(Source, Relative: string): string;
  //{: Converts a string representation to TOIDType. }
  //function  gStrToOIDType(const AString: string): TOIDType;

  function gGetSimplePropType(const AObjectClass: TtiBaseObjectClass; const APropName: string): TtiTypeKind;

  // -----------------------------------------------------------------
  //  Glob vars
  // -----------------------------------------------------------------

var
//  ValidatorStringClass: TValidatorStringGeneratorClass;
  CreateObjectPropertiesNew:  Boolean = true;

implementation

uses
  tiConstants;

//var
//  mSchemaReaderClass: TMapSchemaReaderClass;

//function  gStrToOIDType(const AString: string): TOIDType;
//var
//  s: string;
//begin
//  s := LowerCase(AString);
//  if (s = 'string') or (s = 'guid') then
//    Result := otString
//  else
//    Result := otInt;
//end;

function gGetSimplePropType(const AObjectClass: TtiBaseObjectClass;
  const APropName: string): TtiTypeKind;
var
  pof: TPerObjFactory;
  AObject: TtiBaseObject;
begin
  Assert(AObjectClass<>nil, 'AObjectClass is Nil.');
  pof := TPerObjFactory.Create;
  pof.RegisterClass(AObjectClass.className, TtiClass(AObjectClass));
  AObject := pof.CreateNewInstance(AObjectClass.className);
  pof.Free;
  result := tiGetSimplePropType(AObject, APropName);
end;

//function GetappearNum(sub, st: string): integer;
//var
//    i: integer;
//    P: integer;
//begin
//
//    p := Pos(sub, st);
//    I := 0;
//    while p > 0 do
//    begin
//        inc(i);
//        delete(st, 1, p + length(sub) - 1);
//        p := Pos(sub, st);
//    end;
//    result := i;
//end;
//
//
//
//function decomposestr(sub, st: string; var tst: TStringList): Boolean;
//var
//    num: integer;
//    P: integer;
//
//begin
//    p := Pos(sub, st);
//    tst.Clear;
//    while p > 0 do
//    begin
//        num := p + length(sub) - 1;
//        tst.Add(copy(st, 1, num));
//        delete(st, 1, num);
//        p := Pos(sub, st);
//    end;
//    tst.Add(st);
//    Result := True;
//
//end;
//
//
//
//function CopyLeftNum(sub, st: string; num: integer): string;
//var
//    Tst: TStringList;
//    I: integer;
//begin
//    tst := TStringList.Create;
//    decomposestr(sub, st, Tst);
//    if Num >= Tst.Count then
//        Result := st
//    else
//    begin
//        for i := 0 to num - 1 do
//        begin
//            Result := Result + Tst[i];
//        end;
//    end;
//    Tst.Free;
//end;
//
//
//function CopyRightNum(sub, st: string; Num: integer): string;
//var
//    Tst: TStringList;
//    I: integer;
//begin
//    Tst := TStringList.Create;
//    try
//        decomposestr(sub, st, Tst);
//        Result := '';
//        if Num < Tst.Count then
//        begin
//            for i := Tst.Count - Num to Tst.Count - 1 do
//            begin
//                Result := Result + Tst[i]
//            end;
//        end;
//    finally
//        Tst.Free;
//    end;
//end;
//
//function gValTypeToStr(const AValType: TValidatorType): string;
//begin
//
//  case AValType of
//    vtRequired: result := 'required';
//    vtGreater: result := 'greater';
//    vtGreaterEqual: result := 'greater-equal';
//    vtLess: result := 'less';
//    vtLessEqual: result := 'less-equal';
//    vtNotEqual: result := 'not-equal';
//    vtRegExp: result := 'reg-exp';
//  else
//    Raise Exception.Create('gValTypeToStr: Value out of range');
//  end;
//end;
//
//function GetAbsolutePath(Source, Relative: string): string;
//var
//    i, Num, num1: integer;
//    St: TStringList;
//    s: string;
//begin
//    Num := GetappearNum('..', Relative);
//    St := TStringList.Create;
//    decomposestr(PathDelim, ExcludeTrailingBackslash(Source), st);
//    Num1 := st.Count;
//
//    Result := '';
//
//    for i := 0 to num1 - num - 1 do
//    begin
//        Result := Result + st[i];
//    end;
//
//    if Pos('\', Relative) > 0 then
//      s := CopyRightNum('..\', Relative, 1)
//    else
//    begin
//      if Pos('/', Relative) > 0 then
//        s := CopyRightNum('../', Relative, 1)
//      else
//        // if we got here it means the Relative value is simply a directory name with no slashes
//        s := PathDelim + Relative;
//    end;
//
//    Result := Result + s;
//    st.Free;
//end;
//
//procedure RegisterMappings;
//begin
//
//end;
//
//procedure gSetSchemaReaderClass(const AClass: TMapSchemaReaderClass);
//begin
//  mSchemaReaderClass := AClass;
//end;
//
//function gGetSchemaReaderClass: TMapSchemaReaderClass;
//begin
//  result := mSchemaReaderClass;
//end;
//
//function gStrToClassDefType(const AString: String): TClassDefType;
//begin
//  if LowerCase(AString) = 'create' then
//    result := dtCreate
//  else if LowerCase(AString) = 'reference' then
//    result := dtReference
//  else
//    Raise Exception.Create('gStrToClassDefType: invalid parameter');
//end;
//
//function gStrToPropType(const AString: string): TMapPropType;
//var
//  lType: string;
//begin
//  lType := LowerCase(AString);
//
//  if lType = 'string' then
//    result := ptString
//  else if lType = 'integer' then
//    result := ptInteger
//  else if lType = 'int64' then
//    result := ptInt64
//  else if lType = 'ansistring' then
//    result := ptAnsiString
//  else if lType = 'tdatetime' then
//    result := ptDateTime
//  else if lType = 'boolean' then
//    result := ptBoolean
//  else if lType = 'enum' then
//    result := ptEnum
//  else if lType = 'enumset' then
//    result := ptEnumSet
//  else if lType = 'currency' then
//    result := ptCurrency
//  else if lType = 'double' then
//    Result := ptCurrency
//  else if lType = 'single' then
//    result := ptSingle
//  else if lType = 'blob' then
//    result := ptStream
//  else
//    raise Exception.Create('gStrToPropType: Invalid parameter: ' + AString);
//
//end;
//
//function gPropTypeToStr(const APropType: TMapPropType): string;
//begin
//  case APropType of
//    ptString: result := 'String';
//    ptInt64: result := 'Int64';
//    ptInteger: result := 'Integer';
//    ptAnsiString: result := 'AnsiString';
//    ptBoolean: result := 'Boolean';
//    ptDateTime: Result := 'TDateTime';
//    ptSingle: result := 'Single';
//    ptDouble: result := 'Double';
//    ptCurrency: result := 'Currency';
//    ptEnum: result := 'enum';
//    ptEnumSet: result := 'enumset';
//    ptStream: result := 'blob';
//  end;
//end;
//
//function gFindAttrMap(const AClassName: string; const AAttrName: string): TtiAttrColMap;
//var
//  lMapList: TtiAttrColMaps;
//  lMap: TtiAttrColMap;
//  lCtr: integer;
//begin
//
//  result := nil;
//
//  lMapList := GTIOPFManager.ClassDBMappingMgr.AttrColMaps;
//  for lCtr := 0 to lMapList.Count -1 do
//    begin
//      lMap := lMapList.Items[lCtr];
//      if (lMap.AttrMap.Owner.PerObjAbsClass.ClassName = AClassName) and
//        (SameText(lMap.AttrMap.AttrName, AAttrName)) then
//        begin
//          result := lMap;
//          exit;
//        end;
//    end;
//end;
//
//function gStrToValType(const AString: string): TValidatorType;
//var
//  lStr: string;
//begin
//  lStr := LowerCase(AString);
//
//  if lStr = 'required' then
//    result := vtRequired
//  else if lStr = 'greater' then
//    result := vtGreater
//  else if lStr = 'greater-equal' then
//    result := vtGreaterEqual
//  else if lStr = 'less' then
//    result := vtLess
//  else if lStr = 'less-equal' then
//    result := vtLessEqual
//  else if lStr = 'not-equal' then
//    result := vtNotEqual
//  else if lStr = 'req-exp' then
//    result := vtRegExp
//  else
//    Raise Exception.Create('gStrToValType: Value out of range');
//end;

{ TgMapStringlistUpdater }

procedure TgMapStringlistUpdater.AttachToList;
begin
  if assigned(FtiObjectList) then
    FtiObjectList.AttachObserver(self);
end;

constructor TgMapStringlistUpdater.Create(aStringList: TStringList; atiObjectList: TgBaseMapObjectList; aPropName: String);
begin
  Assert(aStringlist <> nil, 'aStgringList: TStringList must not be nil!');
  Assert(atiObjectList <> nil, 'atiObjectList: TtiObjectList must not be nil!.');

  Assert(typinfo.IsPublishedProp(atiObjectList.BaseItemType.ClassType, aPropName));
  Assert(gGetSimplePropType(TtiBaseObjectClass(atiObjectList.BaseItemType.ClassType), aPropName) = tiTKString, 'aPropanme of ' + aPropName + ' Must be a titkString Type of atiObjectList, ItemType: ClassName of ' + atiObjectList.BaseItemType.ClassName);

  inherited Create;

  FStringList := aStringList;
  FtiObjectList := TgBaseMapObjectList(atiObjectList);
  FPropName := aPropName;

  AttachToList;
  //DoFirstUpdate:
  Update(TtiObject(atiObjectList));
end;

destructor TgMapStringlistUpdater.Destroy;
begin
  if Assigned(FtiObjectList) then
    FtiObjectList.DetachObserver(self);
  inherited Destroy;
end;

procedure TgMapStringlistUpdater.Update(ASubject: TtiObject);
var
  c: Integer;
  stemp: String;
  otemp: TtiObject;
  idx: Integer;
begin
  if ASubject <> FtiObjectList then
    Exit;

  inherited Update(ASubject);  //Does Nothing.

  Assert(Assigned(FStringList), 'Procedure Update: FStringlist is not assigned!');
  Assert(Assigned(FtiObjectList), 'Procedure Update: FtiObjectList is not assigned!');

  FtiObjectList.UpdateTopicList.Sorted := true;
  try
    if FtiObjectList.UpdateTopicList.Find('Stringlist OnChange.', IDX) then
      exit;
  finally
    FtiObjectList.UpdateTopicList.Sorted := false;
  end;

  FStringlist.BeginUpdate;
  FStringList.Clear;
  for c := 0 to FtiObjectList.Count - 1 do
  begin
    oTemp := FtiObjectList.Items[c];
    sTemp := oTemp.PropValue[FPropName];
    FStringList.AddObject(sTemp, oTemp);
  end;
  FStringList.EndUpdate;
end;

{ TgMapProject }

procedure TgMapProject.ClearAll;
begin
  FIncludes.Clear;
  FUnits.Clear;
  ProjectClasses.Clear;
  FProjectEnums.Clear;
  FIncludeFiles.Clear;
end;

procedure TgMapProject.AssignClassProps(ASource: TtiObject);
begin
  Assert(ASource.TestValid(TgMapProject), CTIErrorInvalidObject);

  //inherited AssignClassProps(ASource);

  FProjectClasses.Assign(TgMapProject(ASource).ProjectClasses);
  FProjectEnums.Assign(TgMapProject(ASource).ProjectEnums);
  FUnits.Assign(TgMapProject(ASource).Units);
  FIncludes.Assign(TgMapProject(ASource).FIncludes);

  FIncludeFiles.Assign(TgMapProject(ASource).IncludeFiles);
end;

function TgMapProject.Clone: TgMapProject;
begin
  result := TgMapProject(Inherited Clone);
end;

constructor TgMapProject.Create;
begin
  inherited Create;
  FIncludes := TStringList.Create;

  if CreateObjectPropertiesNew then
  begin
    FUnits := TgMapUnitDefList.CreateNew;
    FProjectClasses := TgMapClassDefList.CreateNew;
    FProjectEnums := TgMapEnumList.CreateNew;
    FIncludeFiles := TgMapProjectIncludeFileList.CreateNew;
  end
  else
  begin
    FUnits := TgMapUnitDefList.Create;
    FProjectClasses := TgMapClassDefList.Create;
    FProjectEnums := TgMapEnumList.Create;
    FIncludeFiles := TgMapProjectIncludeFileList.Create;
  end;

  FProjectClasses.OwnsObjects := false;
  FProjectEnums.OwnsObjects := false;
  FMaxEditorCodeWidth := 80;
  FIncludes.OnChange := @OnIncludesChange;

  //We don't need an OID:
  FStringListUpdater := TgMapStringlistUpdater.Create(FIncludes, FIncludeFiles, 'IncludeFilename');
end;

destructor TgMapProject.Destroy;
begin
  FIncludes.Free;
  FUnits.Free;
  FProjectClasses.Free;
  FProjectEnums.Free;
  FStringListUpdater.Free;
  FIncludeFiles.Free;
  inherited Destroy;
end;

function TgMapProject.FindEnumForPropName(
  const AUnitName: string;
  const AClassName: string;
  const APropName: string): TgMapEnum;
var
  lClassDef: TgMapClassDef;
  lProp: TgMapClassProp;
  lUnit: TgMapUnitDef;
begin
  try
    lUnit := Units.FindByName(AUnitName);
    lClassDef := lUnit.UnitClasses.FindByName(AClassName);
    lProp := lClassDef.ClassProps.FindByName(APropName);
    result := lUnit.UnitEnums.FindByName(lProp.PropTypeName);
  except
    result := nil;
  end;
end;

function TgMapProject.HasCustomSelects: boolean;
var
  lClassCtr, lUnitCtr: integer;
  lUnit: TgMapUnitDef;
  lClassDef: TgMapClassDef;
begin
  result := false;

  for lUnitCtr := 0 to Units.Count - 1 do
    begin
      lUnit := Units.Items[lUnitCtr];
      for lClassCtr := 0 to lUnit.UnitClasses.Count - 1 do
        begin
          lClassDef := lUnit.UnitClasses.Items[lClassCtr];
          if lClassDef.Selections.Count > 0 then
            begin
              result := true;
              exit;
            end;
        end;
    end;
end;

procedure TgMapProject.SetBaseDirectory(const AValue: string);
begin
  if FBaseDirectory=AValue then exit;
  FBaseDirectory:=AValue;
end;

procedure TgMapProject.SetBeginEndTabs(const AValue: integer);
begin
  if FBeginEndTabs=AValue then exit;
  FBeginEndTabs:=AValue;
end;

procedure TgMapProject.SetEnumType(const AValue: TEnumType);
begin
  if FEnumType=AValue then exit;
  FEnumType:=AValue;
end;

procedure TgMapProject.SetFileName(const AValue: string);
begin
  if FFileName=AValue then exit;
  FFileName:=AValue;
end;

procedure TgMapProject.SetIncludeFiles(AValue: TgMapProjectIncludeFileList);
begin
  if FIncludeFiles = AValue then Exit;
  FIncludeFiles := AValue;
end;

procedure TgMapProject.SetMaxEditorCodeWidth(const AValue: integer);
begin
  if FMaxEditorCodeWidth=AValue then exit;
  FMaxEditorCodeWidth:=AValue;
end;

procedure TgMapProject.SetOrigOutDirectory(const AValue: string);
begin
  if FOrigOutDirectory=AValue then exit;
  FOrigOutDirectory:=AValue;
end;

procedure TgMapProject.SetOutputDirectory(const AValue: string);
begin
  if FOutputDirectory=AValue then exit;
  FOutputDirectory:=AValue;
end;

procedure TgMapProject.SetProjectClasses(const AValue: TgMapClassDefList);
begin
  if FProjectClasses=AValue then exit;
  FProjectClasses:=AValue;
end;

procedure TgMapProject.SetProjectName(const AValue: string);
begin
  if FProjectName=AValue then exit;
  FProjectName:=AValue;
end;

procedure TgMapProject.SetTabSpaces(const AValue: integer);
begin
  if FTabSpaces=AValue then exit;
  FTabSpaces:=AValue;
end;

procedure TgMapProject.SetVisibilityTabs(const AValue: integer);
begin
  if FVisibilityTabs=AValue then exit;
  FVisibilityTabs:=AValue;
end;

procedure TgMapProject.OnIncludesChange(AObject: TObject);
var
  ic: Integer;
  temp: TgMapProjectIncludeFile;
begin
  //Copy Includes to IncludeFIles.
  FIncludeFiles.BeginUpdate('Stringlist OnChange.');
  FIncludeFiles.Clear;
  for ic := 0 to Includes.Count - 1 do
    begin
      temp := TgMapProjectIncludeFile.Create;
      temp.IncludeFilename := Includes.Strings[ic];
      FIncludeFiles.Add(temp);
    end;
  FIncludeFiles.EndUpdate;
end;

{ TgBaseMapObjectList }

function TgBaseMapObjectList.Add(AObject: TBaseMapObject): Integer;
begin
  Result := inherited Add(AObject);
end;

function TgBaseMapObjectList.Add(out IDX: Integer): TtiObject;
var
  factory: TPerObjFactory;
  temp: TtiObject;
begin
  result := nil;
  IDX := -1;
  factory := TPerObjFactory.create;
  try
    factory.RegisterClass(BaseItemType.ClassName, TtiClass(BaseItemType.ClassType));
    temp := factory.CreateInstance(BaseItemType.ClassName);
    IDX := inherited Add(Temp);
    result := temp;
  finally
    factory.Free;
  end;
end;

function TgBaseMapObjectList.AddNew(out IDX: Integer): TtiObject;
var
  factory: TPerObjFactory;
  temp: TtiObject;
begin
  result := nil;
  IDX := -1;
  factory := TPerObjFactory.create;
  try
    factory.RegisterClass(BaseItemType.ClassName, TtiClass(BaseItemType.ClassType));
    temp := factory.CreateNewInstance(BaseItemType.ClassName);
    IDX := inherited Add(Temp);
    result := temp;
  finally
    factory.Free;
  end;
end;

class function TgBaseMapObjectList.BaseItemType: TClass;
begin
  result := TBaseMapObject;
end;

function TgBaseMapObjectList.GetItems(i: Integer): TBaseMapObject;
begin
  result := inherited GetItems(i) as TBaseMapObject;
end;

procedure TgBaseMapObjectList.SetItems(i: Integer; AObject: TBaseMapObject);
begin
  inherited SetItems(i, AObject);
end;

{ TgMapProjectList }

function TgMapProjectList.Add(AObject: TgMapProject): Integer;
begin
  result := inherited Add(AObject);
end;

function TgMapProjectList.GetItems(i: Integer): TgMapProject;
begin
  result := inherited GetItems(i) as TgMapProject;
end;

procedure TgMapProjectList.SetItems(i: Integer; AObject: TgMapProject);
begin
  inherited SetItems(i, AObject);
end;

class function TgMapProjectList.BaseItemType: TClass;
begin
  result := TgMapProject;
end;

{ TgMapConnectionDef }

constructor TgMapConnectionDef.Create;
begin
  inherited Create;
  FParams := TStringList.Create;
end;

destructor TgMapConnectionDef.Destroy;
begin
  FParams.free;
  inherited Destroy;
end;

procedure TgMapConnectionDef.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //No Object Properties.
  //Assert(ASource.TestValid(TgMapConnectionDef), CTIErrorInvalidObject);
end;

function TgMapConnectionDef.Clone: TgMapConnectionDef;
begin
  result := TgMapConnectionDef(inherited Clone);
end;

procedure TgMapConnectionDef.SetConnType(const AValue: string);
begin
  if FConnType=AValue then exit;
  FConnType:=AValue;
end;

procedure TgMapConnectionDef.SetDataSource(const AValue: string);
begin
  if FDataSource=AValue then exit;
  FDataSource:=AValue;
end;

procedure TgMapConnectionDef.SetHost(const AValue: string);
begin
  if FHost=AValue then exit;
  FHost:=AValue;
end;

{ TgMapConnectionDefList }

function TgMapConnectionDefList.Add(AObject: TgMapConnectionDef): Integer;
begin
  result := inherited Add(AObject);
end;

class function TgMapConnectionDefList.BaseItemType: TClass;
begin
  result := TgMapConnectionDefList;
end;

function TgMapConnectionDefList.GetItems(i: Integer): TgMapConnectionDef;
begin
  result := TgMapConnectionDef(inherited GetItems(i));
end;

procedure TgMapConnectionDefList.SetItems(i: Integer;
  AObject: TgMapConnectionDef);
begin
  inherited SetItems(i, AObject);
end;

{ TgMapUnitDef }

constructor TgMapUnitDef.Create;
begin
  inherited Create;
  if CreateObjectPropertiesNew then
  begin
    FUnitClasses := TgMapClassDefList.CreateNew;
    FUnitEnums := TgMapEnumList.CreateNew;
    UnitReferences := TgMapUnitReferenceList.CreateNew;
  end
  else
  begin
    FUnitClasses := TgMapClassDefList.Create;
    FUnitEnums := TgMapEnumList.Create;
    FUnitReferences := TgMapUnitReferenceList.Create;
  end;
  FReferences := TStringList.Create;

  FReferences.OnChange := @OnReferencesChange;

  //We don't need an OID:
  FStringListUpdater := TgMapStringlistUpdater.Create(FReferences, FUnitReferences, 'UnitReference');

end;

destructor TgMapUnitDef.Destroy;
begin
  FUnitClasses.Free;
  FUnitEnums.Free;
  FReferences.Free;
  FUnitReferences.Free;
  inherited Destroy;
end;

function TgMapUnitDef.HasValidators: boolean;
var
  lClassCtr: integer;
begin
  result := false;

  for lClassCtr := 0 to UnitClasses.Count - 1 do
    begin
      if UnitClasses.Items[lClassCtr].Validators.Count > 0 then
        begin
          result := true;
          exit;
        end;
    end;
end;

procedure TgMapUnitDef.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  Assert(ASource.TestValid(TgMapUnitDef), CTIErrorInvalidObject);
  //// Object properties
  //property    UnitClasses: TgMapClassDefList read FUnitClasses;
  //property    UnitEnums: TgMapEnumList read FUnitEnums;
  //property    References: TStringList read FReferences;
  FUnitClasses.Assign(TgMapUnitDef(ASource).UnitClasses);
  FUnitEnums.Assign(TgMapUnitDef(ASource).UnitEnums);
  FReferences.Assign(TgMapUnitDef(ASource).References);
  FUnitReferences.Assign(TgMapUnitDef(ASource).UnitReferences);
end;

function TgMapUnitDef.Clone: TgMapUnitDef;
begin
  result := TgMapUnitDef(inherited Clone);
end;

procedure TgMapUnitDef.SetUnitName(const AValue: string);
begin
  if FName=AValue then exit;
  FName:=AValue;
end;

procedure TgMapUnitDef.SetUnitReferences(AValue: TgMapUnitReferenceList);
begin
  if FUnitReferences = AValue then Exit;
  FUnitReferences := AValue;
end;

procedure TgMapUnitDef.OnReferencesChange(AObject: TObject);
var
  ic: Integer;
  temp: TgMapUnitReference;
begin
  //Copy Includes to IncludeFIles.
  FUnitReferences.BeginUpdate('Stringlist OnChange.');
  FUnitReferences.Clear;
  for ic := 0 to References.Count - 1 do
    begin
      temp := TgMapUnitReference.CreateNew;
      temp.UnitReference := FReferences.Strings[ic];
      FUnitReferences.Add(temp);
    end;
  FReferences.EndUpdate;
end;

{ TgMapEnumValue }

constructor TgMapEnumValue.Create;
begin
  inherited Create;
  FEnumValue := -1;
end;

destructor TgMapEnumValue.Destroy;
begin
  inherited Destroy;
end;

procedure TgMapEnumValue.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //No Object Properties.
  //Assert(ASource.TestValid(TgMapEnumValue), CTIErrorInvalidObject);
end;

function TgMapEnumValue.Clone: TgMapEnumValue;
begin
  result := TgMapEnumValue(inherited Clone);
end;

procedure TgMapEnumValue.SetEnumValue(const AValue: integer);
begin
  if FEnumValue=AValue then exit;
  FEnumValue:=AValue;
end;

procedure TgMapEnumValue.SetEnumValueName(const AValue: string);
begin
  if FEnumValueName=AValue then exit;
  FEnumValueName:=AValue;
end;

{ TgMapEnumValueList }

function TgMapEnumValueList.Add(const AName: string; const AValue: integer
  ): integer;
var
  lValue: TgMapEnumValue;
begin
  lValue := TgMapEnumValue.Create;
  lValue.EnumValue := AValue;
  lValue.EnumValueName := AName;
  result := Self.Add(lValue);
end;

class function TgMapEnumValueList.BaseItemType: TClass;
begin
  result := TgMapEnumValue;
end;

function TgMapEnumValueList.Add(AObject: TgMapEnumValue): Integer;
begin
  result := inherited Add(AObject);
end;

function TgMapEnumValueList.GetItems(i: Integer): TgMapEnumValue;
begin
  result := TgMapEnumValue(inherited GetItems(i));
end;

procedure TgMapEnumValueList.SetItems(i: Integer; AObject: TgMapEnumValue);
begin
  inherited SetItems(i, AObject);
end;

{ TgMapEnum }

constructor TgMapEnum.Create;
begin
  inherited Create;
  if CreateObjectPropertiesNew then
  begin
    FValues := TgMapEnumValueList.CreateNew();
  end
  else
  begin
    FValues := TgMapEnumValueList.Create;
  end;
end;

destructor TgMapEnum.Destroy;
begin
  FValues.Free;
  inherited Destroy;
end;

procedure TgMapEnum.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  Assert(ASource.TestValid(TgMapEnum), CTIErrorInvalidObject);
  Values.Assign(TgMapEnum(ASource).Values);
end;

function TgMapEnum.Clone: TgMapEnum;
begin
  result := TgMapEnum(inherited Clone);
end;

procedure TgMapEnum.SetEnumName(const AValue: string);
begin
  if FEnumName = AValue then
    Exit;
  FEnumName := AValue;
end;

procedure TgMapEnum.SetEnumSetName(const AValue: string);
begin
  if FEnumSetName = AValue then
    Exit;
  FEnumSetName := AValue;
end;


procedure TgMapEnum.SetValues(const AValue: TgMapEnumValueList);
begin
  if FValues = AValue then
    Exit;
  FreeAndNil(FValues);
  FValues := AValue;
end;

{ TgMapClassDef }

constructor TgMapClassDef.Create;
begin
  inherited Create;
  if CreateObjectPropertiesNew then
  begin
    FClassProps := TgMapClassPropList.CreateNew;
    FClassMapping := TgClassMapping.CreateNew;
    FSelections := TgClassMappingSelectList.CreateNew;
    FValidators := TgMapValidatorList.CreateNew;
  end
  else
  begin
    FClassProps := TgMapClassPropList.Create;
    FClassMapping := TgClassMapping.Create;
    FSelections := TgClassMappingSelectList.Create;
    FValidators := TgMapValidatorList.Create;
  end;
end;

destructor TgMapClassDef.Destroy;
begin
  FClassProps.Free;
  FClassMapping.free;
  FSelections.Free;
  FValidators.Free;
  inherited Destroy;
end;

procedure TgMapClassDef.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
      // Object Props
    //property    ClassProps: TgMapClassPropList read FClassProps write SetClassProps;
    //property    ClassMapping: TgClassMapping read FClassMapping;
    //property    Selections: TgClassMappingSelectList read FSelections;
    //property    Validators: TgMapValidatorList read FValidators;
  Assert(ASource.TestValid(TgMapClassDef), CTIErrorInvalidObject);
  ClassProps.Assign(TgMapClassDef(ASource).ClassProps);
  ClassMapping.Assign(TgMapClassDef(ASource).ClassMapping);
  Selections.Assign(TgMapClassDef(ASource).Selections);
  Validators.Assign(TgMapClassDef(ASource).Validators);
end;

function TgMapClassDef.Clone: TgMapClassDef;
begin
  result := TgMapClassDef(inherited Clone);
end;

procedure TgMapClassDef.SetAutoCreateBase(const AValue: boolean);
begin
  if FAutoCreateBase=AValue then exit;
  FAutoCreateBase:=AValue;
end;

procedure TgMapClassDef.SetAutoCreateListClass(const AValue: boolean);
begin
  if FAutoCreateListClass=AValue then exit;
  FAutoCreateListClass:=AValue;
end;

procedure TgMapClassDef.SetAutoMap(const AValue: boolean);
begin
  if FAutoMap=AValue then exit;
  FAutoMap:=AValue;
end;

procedure TgMapClassDef.SetBaseClassName(const AValue: string);
begin
  if FBaseClassName=AValue then exit;
  FBaseClassName:=AValue;
end;

procedure TgMapClassDef.SetBaseClassParent(const AValue: string);
begin
  if FBaseClassParent=AValue then exit;
  FBaseClassParent:=AValue;
end;

procedure TgMapClassDef.SetBaseListClassParent(AValue: string);
begin
  if FBaseListClassParent=AValue then Exit;
  FBaseListClassParent:=AValue;
end;

procedure TgMapClassDef.SetBaseUnitName(const AValue: string);
begin
  if FBaseUnitName=AValue then exit;
  FBaseUnitName:=AValue;
end;

procedure TgMapClassDef.SetClassProps(const AValue: TgMapClassPropList);
begin
  if FClassProps=AValue then exit;
  FClassProps:=AValue;
end;

procedure TgMapClassDef.SetCrud(const AValue: string);
begin
  if FCrud=AValue then exit;
  FCrud:=AValue;
end;

procedure TgMapClassDef.SetDefType(const AValue: TClassDefType);
begin
  if FDefType=AValue then exit;
  FDefType:=AValue;
end;

procedure TgMapClassDef.SetForwardDeclare(const AValue: boolean);
begin
  if FForwardDeclare=AValue then exit;
  FForwardDeclare:=AValue;
end;

procedure TgMapClassDef.SetListSavesDatabaseName(const AValue: boolean);
begin
  if FListSavesDatabaseName=AValue then exit;
  FListSavesDatabaseName:=AValue;
end;

procedure TgMapClassDef.SetNotifyObserversOfPropertyChanges(const AValue: boolean);
begin
  if FNotifyObserversOfPropertyChanges = AValue then exit;
  FNotifyObserversOfPropertyChanges := AValue;
end;

procedure TgMapClassDef.SetORMClassName(const AValue: string);
begin
  if FORMClassName=AValue then exit;
  FORMClassName:=AValue;
end;

{ TgMapClassDefList }

function TgMapClassDefList.Add(AObject: TgMapClassDef): Integer;
begin
  result := inherited Add(AObject);
end;

function TgMapClassDefList.FindByName(const AName: string): TgMapClassDef;
var
  lCtr: integer;
  lName: string;
begin
  result := nil;

  lName := LowerCase(AName);

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].BaseClassName) = lName then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

class function TgMapClassDefList.BaseItemType: TClass;
begin
  result := TgMapClassDef;
end;

function TgMapClassDefList.GetItems(i: Integer): TgMapClassDef;
begin
  result := TgMapClassDef(inherited GetItems(i));
end;

procedure TgMapClassDefList.SetItems(i: Integer; AObject: TgMapClassDef);
begin
  inherited SetItems(i, AObject);
end;

{ TgMapClassProp }

procedure TgMapClassProp.SetIsReadOnly(const AValue: boolean);
begin
  if FIsReadOnly=AValue then exit;
  FIsReadOnly:=AValue;
end;

procedure TgMapClassProp.SetPropName(const AValue: string);
begin
  if FName=AValue then exit;
  FName:=AValue;
end;

procedure TgMapClassProp.SetPropType(const AValue: TMapPropType);
begin
  if FPropertyType=AValue then exit;
  FPropertyType:=AValue;
end;

procedure TgMapClassProp.SetPropTypeName(const AValue: string);
begin
  if FPropTypeName=AValue then exit;
  FPropTypeName:=AValue;
end;

procedure TgMapClassProp.SetVirtualGetter(AValue: boolean);
begin
  if FVirtualGetter=AValue then Exit;
  FVirtualGetter:=AValue;
end;

procedure TgMapClassProp.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //Assert(ASource.TestValid(TgMapClassProp), CTIErrorInvalidObject);
  //No Object Properties.
end;

function TgMapClassProp.Clone: TgMapClassProp;
begin
  result := TgMapClassProp(inherited Clone);
end;

{ TgMapClassPropList }

function TgMapClassPropList.Add(const AName: string;
  const APropType: TMapPropType): integer;
var
  lProp: TgMapClassProp;
begin
  lProp := TgMapClassProp.create;
  lProp.Name := AName;
  lProp.PropertyType := APropType;
  result := self.Add(lProp);
end;

function TgMapClassPropList.Add(AObject: TgMapClassProp): Integer;
begin
  result := inherited Add(AObject);
end;

function TgMapClassPropList.FindByName(const AName: string): TgMapClassProp;
var
  lCtr: Integer;
begin
  result := nil;

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].Name) = LowerCase(AName) then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

class function TgMapClassPropList.BaseItemType: TClass;
begin
  result := TgMapClassProp;
end;

function TgMapClassPropList.GetItems(i: Integer): TgMapClassProp;
begin
  result := TgMapClassProp(inherited GetItems(i));
end;

procedure TgMapClassPropList.SetItems(i: Integer; AObject: TgMapClassProp);
begin
  inherited SetItems(i, AObject);
end;

{ TgClassMapping }

constructor TgClassMapping.Create;
begin
  inherited Create;
  if CreateObjectPropertiesNew then
  begin
    FPropMappings := TgPropMappingList.CreateNew;
  end
  else
  begin
    FPropMappings := TgPropMappingList.Create;
  end;
end;

destructor TgClassMapping.Destroy;
begin
  FPropMappings.Free;
  inherited Destroy;
end;

procedure TgClassMapping.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  Assert(ASource.TestValid(TgClassMapping), CTIErrorInvalidObject);
  //PropMappings is Published, Do I need to do this?
  PropMappings.Assign(TgClassMapping(ASource).PropMappings);
end;

function TgClassMapping.Clone: TgClassMapping;
begin
  result := TgClassMapping(inherited Clone);
end;

procedure TgClassMapping.SetOIDType(const AValue: TOIDType);
begin
  if FOIDType=AValue then exit;
  FOIDType:=AValue;
end;

procedure TgClassMapping.SetPKField(const AValue: string);
begin
  if FPKField=AValue then exit;
  FPKField:=AValue;
end;

procedure TgClassMapping.SetPKName(const AValue: string);
begin
  if FPKName=AValue then exit;
  FPKName:=AValue;
end;

procedure TgClassMapping.SetTableName(const AValue: string);
begin
  if FTableName=AValue then exit;
  FTableName:=AValue;
end;

{ TgClassMappingList }

function TgClassMappingList.Add(AObject: TgClassMapping): Integer;
begin
  result := inherited Add(AObject);
end;

class function TgClassMappingList.BaseItemType: TClass;
begin
  result := TgClassMapping;
end;

function TgClassMappingList.GetItems(i: Integer): TgClassMapping;
begin
  result := TgClassMapping(inherited GetItems(i));
end;

procedure TgClassMappingList.SetItems(i: Integer; AObject: TgClassMapping);
begin
  inherited SetItems(i, AObject);
end;

{ TgPropMapping }

function TgPropMapping.IsValid(const AErrors: TtiObjectErrors): Boolean;
begin
  result := inherited IsValid(AErrors);

  if not result then
    exit;

  if (PropName = '') or (Pos(' ', PropName) > 0)  then
    begin
      AErrors.AddError('PropName: Must be present and include no spaces');
    end;

  if (FieldName = '') or (Pos(' ', FieldName) > 0)  then
    begin
      AErrors.AddError('Database Field Name: Must be present and include no spaces');
    end;

  Result := AErrors.Count = 0;

end;

procedure TgPropMapping.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //Assert(ASource.TestValid(TgPropMapping), CTIErrorInvalidObject);
  //No Object Propeties.
end;

function TgPropMapping.Clone: TgPropMapping;
begin
  result := TgPropMapping(inherited Clone);
end;

procedure TgPropMapping.SetFieldName(const AValue: string);
begin
  if FFieldName=AValue then exit;
  FFieldName:=AValue;
end;

procedure TgPropMapping.SetPropName(const AValue: string);
begin
  if FPropName=AValue then exit;
  FPropName:=AValue;
end;

procedure TgPropMapping.SetPropType(const AValue: TMapPropType);
begin
  if FPropertyType=AValue then exit;
  FPropertyType:=AValue;
end;

procedure TgPropMapping.SetPropertyGetter(const AValue: string);
begin
  if FPropertyGetter=AValue then exit;
  FPropertyGetter:=AValue;
end;

procedure TgPropMapping.SetPropertySetter(const AValue: string);
begin
  if FPropertySetter=AValue then exit;
  FPropertySetter:=AValue;
end;

{ TgPropMappingList }

function TgPropMappingList.Add(AObject: TgPropMapping): Integer;
begin
  result := inherited Add(AObject);
end;

class function TgPropMappingList.BaseItemType: TClass;
begin
  result := TgPropMapping;
end;

function TgPropMappingList.GetItems(i: Integer): TgPropMapping;
begin
  result := TgPropMapping(inherited GetItems(i));
end;

procedure TgPropMappingList.SetItems(i: Integer; AObject: TgPropMapping);
begin
  inherited SetItems(i, AObject);
end;

{ TgFilterDef }

procedure TgFilterDef.SetField(const AValue: String);
begin
  if FField=AValue then exit;
  FField:=AValue;
end;

procedure TgFilterDef.SetFilterType(const AValue: TFilterType);
begin
  if FFilterType=AValue then exit;
  FFilterType:=AValue;
end;

procedure TgFilterDef.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //Assert(ASource.TestValid(TgFilterDef), CTIErrorInvalidObject);
  //FilterType := TgFilterDef(ASource).FilterType;
  //Field := TgFilterDef(ASource).Field;
end;

function TgFilterDef.Clone: TgFilterDef;
begin
  result := TgFilterDef(inherited Clone);
end;

{ TgFilterDefList }

function TgFilterDefList.Add(AObject: TgFilterDef): Integer;
begin
  result := inherited Add(AObject);
end;

class function TgFilterDefList.BaseItemType: TClass;
begin
  result := TgFilterDef;
end;

function TgFilterDefList.GetItems(i: Integer): TgFilterDef;
begin
  result := TgFilterDef(inherited GetItems(i));
end;

procedure TgFilterDefList.SetItems(i: Integer; AObject: TgFilterDef);
begin
  inherited SetItems(i, AObject);
end;

{ TgMapEnumList }

function TgMapEnumList.Add(AObject: TgMapEnum): Integer;
begin
  result := inherited Add(AObject);
end;

function TgMapEnumList.FindByName(const AName: string): TgMapEnum;
var
  lCtr: integer;
  lName: string;
begin
  result := nil;

  lName := LowerCase(AName);

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].EnumName) = lName then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

class function TgMapEnumList.BaseItemType: TClass;
begin
  result := TgMapEnum;
end;

function TgMapEnumList.GetItems(i: Integer): TgMapEnum;
begin
  result := TgMapEnum(inherited GetItems(i));
end;

procedure TgMapEnumList.SetItems(i: Integer; AObject: TgMapEnum);
begin
  inherited SetItems(i, AObject);
end;

{ TgMapUnitDefList }

function TgMapUnitDefList.Add(AObject: TgMapUnitDef): Integer;
begin
  result := inherited Add(AObject);
end;

function TgMapUnitDefList.FindByName(const AName: string): TgMapUnitDef;
var
  lCtr: integer;
  lName: string;
begin
  result := nil;

  lName := LowerCase(AName);

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].Name) = lName then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

function TgMapUnitDefList.NameExists(const AName: String): Boolean;
var
  lCtr: integer;
  lName: string;
begin
  result := false;

  lName := LowerCase(AName);

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].Name) = lName then
        begin
          result := true;
          exit;
        end;
    end;
end;

class function TgMapUnitDefList.BaseItemType: TClass;
begin
  result := TgMapUnitDef;
end;

function TgMapUnitDefList.GetItems(i: Integer): TgMapUnitDef;
begin
  result := TgMapUnitDef(inherited GetItems(i));
end;

procedure TgMapUnitDefList.SetItems(i: Integer; AObject: TgMapUnitDef);
begin
  inherited SetItems(i, AObject);
end;

//{ TMapSchemaWriter }
//
//constructor TMapSchemaWriter.Create(AProject: TgMapProject);
//begin
//  inherited Create;
//  FProject := AProject;
//end;
//
//procedure TMapSchemaWriter.DecTab;
//begin
//  IncTab(-1);
//end;
//
//destructor TMapSchemaWriter.Destroy;
//begin
//  inherited Destroy;
//end;
//
//procedure TMapSchemaWriter.IncTab(const ANum: integer);
//begin
//  FCurrentIndent := (FCurrentIndent + ANum);
//end;
//
//procedure TMapSchemaWriter.SetCurrentIndent(const AValue: integer);
//begin
//  if FCurrentIndent=AValue then exit;
//  FCurrentIndent:=AValue;
//end;
//
//procedure TMapSchemaWriter.SetOnWriteClass(const AValue: TOnWriteClassIntf);
//begin
//  FOnWriteClass:=AValue;
//end;
//
//procedure TMapSchemaWriter.SetOnWriteEnum(const AValue: TOnWriteEnum);
//begin
//  FOnWriteEnum:=AValue;
//end;
//
//procedure TMapSchemaWriter.SetOnWriteMapping(const AValue: TOnWriteMapping);
//begin
//  FOnWriteMapping:=AValue;
//end;
//
//procedure TMapSchemaWriter.SetOnWriteUnit(const AValue: TOnWriteUnit);
//begin
//  FOnWriteUnit:=AValue;
//end;
//
//procedure TMapSchemaWriter.SetProject(const AValue: TgMapProject);
//begin
//  FProject:=AValue;
//end;
//
//function TMapSchemaWriter.TabToSpaces(const ANumTabs: integer): string;
//begin
//  result := StringOfChar(' ', ANumTabs * Project.TabSpaces);
//end;
//
//procedure TMapSchemaWriter.WriteLine(const AText: string; AList: TStringList);
//var
//  lPrefix: string;
//begin
//  lPrefix := TabToSpaces(CurrentIndent);
//  AList.Add(lPrefix + AText);
//end;
//
//procedure TMapSchemaWriter.WriteBreak(AList: TStringList);
//begin
//  WriteLine('', AList);
//end;

{ TgSelectParam }

procedure TgSelectParam.SetParamName(const AValue: string);
begin
  if FParamName=AValue then exit;
  FParamName:=AValue;
end;

procedure TgSelectParam.SetParamType(const AValue: TMapPropType);
begin
  if FParamType=AValue then exit;
  FParamType:=AValue;
end;

procedure TgSelectParam.SetParamTypeName(const AValue: string);
begin
  if FParamTypeName=AValue then exit;
  FParamTypeName:=AValue;
end;

procedure TgSelectParam.SetPassBy(const AValue: string);
begin
  if FPassBy=AValue then exit;
  FPassBy:=AValue;
end;

procedure TgSelectParam.SetSQLParamName(const AValue: string);
begin
  if FSQLParamName=AValue then exit;
  FSQLParamName:=AValue;
end;

procedure TgSelectParam.SetTypeName(const AValue: string);
begin
  if FTypeName=AValue then exit;
  FTypeName:=AValue;
end;

procedure TgSelectParam.SetValue(const AValue: Variant);
begin
  if FValue=AValue then exit;
  FValue:=AValue;
end;

procedure TgSelectParam.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //Assert(ASource.TestValid(TgSelectParam), CTIErrorInvalidObject);
  //No Object Properties.
end;

function TgSelectParam.Clone: TgSelectParam;
begin
  result := TgSelectParam(inherited Clone);
end;

{ TgSelectParamList }

function TgSelectParamList.Add(AObject: TgSelectParam): Integer;
begin
  result := inherited Add(AObject);
end;

function TgSelectParamList.FindByName(const AName: string): TgSelectParam;
var
  lCtr: Integer;
begin
  result := nil;

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].ParamName) = LowerCase(AName) then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

class function TgSelectParamList.BaseItemType: TClass;
begin
  result := TgSelectParam;
end;

function TgSelectParamList.GetItems(i: Integer): TgSelectParam;
begin
  result := TgSelectParam(inherited GetItems(i));
end;

procedure TgSelectParamList.SetItems(i: Integer; AObject: TgSelectParam);
begin
  inherited SetItems(i, AObject);
end;

{ TgClassMappingSelect }

constructor TgClassMappingSelect.Create;
begin
  inherited Create;
  FSQL := '';

  if CreateObjectPropertiesNew then
  begin
    FParams := TgSelectParamList.CreateNew;
  end
  else
  begin
    FParams := TgSelectParamList.Create;
  end;
end;

destructor TgClassMappingSelect.Destroy;
begin
  FParams.Free;
  inherited Destroy;
end;

procedure TgClassMappingSelect.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  Assert(ASource.TestValid(TgClassMappingSelect), CTIErrorInvalidObject);
  Params.Assign(TgClassMappingSelect(ASource).Params);
end;

function TgClassMappingSelect.Clone: TgClassMappingSelect;
begin
  result := TgClassMappingSelect(inherited Clone);
end;

function TgClassMappingSelect.GetCaption: string;
var
  lCtr: integer;
  lParams: string;
  lPar: TgSelectParam;
begin
  lParams := '';
  result := FName + '(';
  for lCtr := 0 to FParams.Count - 1 do
    begin
      lPar := FParams.Items[lCtr];
      if lParams = '' then
        lParams := lPar.ParamName
      else
        lParams := lParams + ', ' + lPar.ParamName;
    end;
  result := result + lParams + ')';

end;

procedure TgClassMappingSelect.SetName(const AValue: string);
begin
  if FName=AValue then exit;
  FName:=AValue;
end;

procedure TgClassMappingSelect.SetSQL(const Value: string);
begin
  FSQL := Value;
end;

{ TgClassMappingSelectList }

function TgClassMappingSelectList.Add(AObject: TgClassMappingSelect): Integer;
begin
  result := inherited Add(AObject);
end;

class function TgClassMappingSelectList.BaseItemType: TClass;
begin
  result := TgClassMappingSelect;
end;

function TgClassMappingSelectList.GetItems(i: Integer): TgClassMappingSelect;
begin
  result := TgClassMappingSelect(inherited GetItems(i));
end;

procedure TgClassMappingSelectList.SetItems(i: Integer;
  AObject: TgClassMappingSelect);
begin
  inherited SetItems(i, AObject);
end;

//{ TtiMapParameterListReadVisitor }
//
//constructor TtiMapParameterListReadVisitor.Create;
//begin
//  FParams := TgSelectParamList.Create;
//  inherited Create;
//end;
//
//destructor TtiMapParameterListReadVisitor.Destroy;
//begin
//  FParams.Free;
//  inherited Destroy;
//end;
//
//procedure TtiMapParameterListReadVisitor.Init;
//begin
//  Query.SQLText := TtiMappedFilteredObjectList(Visited).SQL;
//  Query.SQL.SaveToFile('sql.txt');
//end;
//
//procedure TtiMapParameterListReadVisitor.SetClassDef(const AValue: TgMapClassDef);
//begin
//  if FClassDef=AValue then exit;
//  FClassDef:=AValue;
//end;
//
//procedure TtiMapParameterListReadVisitor.SetEnumType(const AValue: TEnumType);
//begin
//  if FEnumType=AValue then exit;
//  FEnumType:=AValue;
//end;
//
//procedure TtiMapParameterListReadVisitor.SetObjClass(const AValue: TtiObjectClass);
//begin
//  if FObjClass=AValue then exit;
//  FObjClass:=AValue;
//end;
//
//procedure TtiMapParameterListReadVisitor.SetSQL(const AValue: string);
//begin
//  if FSQL=AValue then exit;
//  FSQL:=AValue;
//end;
//
//procedure TtiMapParameterListReadVisitor.SetupParams;
//(*
//var
//  lCtr: integer;
//  lParam: TgSelectParam;
//  lList: TtiMappedFilteredObjectList;
//  lProp: TgMapClassProp;
//*)
//begin
//  inherited SetupParams;
//
//(*
//  lList := TtiMappedFilteredObjectList(Visited);
//
//  for lCtr := 0 to lList.Params.Count - 1 do
//    begin
//      lParam := lList.Params.Items[lCtr];
//
//      case lParam.ParamType of
//        ptString,
//        ptAnsiString:
//          Query.ParamAsString[lParam.SQLParamName] := lParam.Value;
//
//        ptBoolean:
//          Query.ParamAsBoolean[lParam.SQLParamName] := lParam.Value;
//
//        ptDateTime:
//          Query.ParamAsDateTime[lParam.SQLParamName] := lParam.Value;
//
//        ptDouble,
//        ptCurrency,
//        ptSingle:
//          Query.ParamAsFloat[lParam.SQLParamName] := lParam.Value;
//
//        ptInt64,
//        ptInteger:
//          Query.ParamAsInteger[lParam.SQLParamName] := lParam.Value;
//
//        ptEnum:
//          begin
//            if lList.EnumType = etString then
//              Query.ParamAsString[lParam.SQLParamName] := GetEnumName(TypeInfo(TMapPropType), Integer(lParam.Value))
//            else
//              Query.ParamAsInteger[lParam.SQLParamName] := Integer(lParam.Value);
//          end;
//
//        ptStream:
//          Query.AssignParamFromStream(lParam.SQLParamName, TStream(lParam.Value));
//      end;
//    end;
//*)
//end;

//{ TtiMappedFilteredObjectList }
//
//procedure TtiMappedFilteredObjectList.AddParam(const AName: string; const ASQLParamName: string;
//  AParamType: TMapPropType; AValue: Variant);
//var
//  lParam: TgSelectParam;
//begin
//  lParam := FParams.FindByName(Aname);
//  if lParam <> nil then
//    exit;
//
//  lParam := TgSelectParam.Create;
//  lParam.ParamName := AName;
//  lParam.ParamType := AParamType;
//  lParam.SQLParamName := ASQLParamName;
//  lParam.Value := AValue;
//  FParams.Add(lParam);
//end;
//
//constructor TtiMappedFilteredObjectList.Create;
//begin
//  inherited Create;
//  FParams := TgSelectParamList.Create;
//end;
//
//destructor TtiMappedFilteredObjectList.Destroy;
//begin
//  FParams.Free;
//  inherited Destroy;
//end;
//
//procedure TtiMappedFilteredObjectList.SetEnumType(const AValue: TEnumType);
//begin
//  if FEnumType=AValue then exit;
//  FEnumType:=AValue;
//end;
//
//procedure TtiMappedFilteredObjectList.SetObjClass(const AValue: TtiObjectClass
//  );
//begin
//  if FObjClass=AValue then exit;
//  FObjClass:=AValue;
//end;
//
//procedure TtiMappedFilteredObjectList.SetSQL(const AValue: String);
//begin
//  if FSQL=AValue then exit;
//  FSQL:=AValue;
//end;

{ TgMapValidator }

procedure TgMapValidator.SetClassProp(const AValue: string);
begin
  if FClassProp=AValue then exit;
  FClassProp:=AValue;
end;

procedure TgMapValidator.SetValidatorType(const AValue: TValidatorType);
begin
  if FValidatorType=AValue then exit;
  FValidatorType:=AValue;
end;

procedure TgMapValidator.SetValue(const AValue: variant);
begin
  FValue:=AValue;
end;

procedure TgMapValidator.AssignClassProps(ASource: TtiObject);
begin
  //inherited AssignClassProps(ASource);
  //Assert(ASource.TestValid(TgMapValidator), CTIErrorInvalidObject);
  // No Object Properties.
end;

function TgMapValidator.Clone: TgMapValidator;
begin
  result := TgMapValidator(inherited Clone);
end;

{ TgMapValidatorList }

procedure TgMapValidatorList.Add(AObject: TgMapValidator);
begin
  inherited Add(AObject);
end;

class function TgMapValidatorList.BaseItemType: TClass;
begin
  result := TgMapValidator;
end;

function TgMapValidatorList.GetItems(i: integer): TgMapValidator;
begin
  result := inherited GetItems(i) as TgMapValidator;
end;

procedure TgMapValidatorList.SetItems(i: integer; const AValue: TgMapValidator);
begin
  inherited SetItems(i, AValue);
end;

{ TValidatorStringGenerator }
{
  TValidatorType = (vtRequired, vtGreater, vtGreaterEqual, vtLess, vtLessEqual,
    vtNotEqual, vtRegExp);
}


//class function TValidatorStringGenerator.CreateGreaterOrEqualValidatorMsg(
//  AObject: TtiObject; const APropName: string; AValue: Variant): string;
//var
//  lType: TtiTypeKind;
//  lValue: string;
//const
//  MSG = 'Value of %s must be greater than or equal to ';
//begin
//  lType := tiGetSimplePropType(AObject, APropName);
//  if lType = tiTKInteger then
//    lValue := IntToStr(AValue)
//  else
//    lValue := formatFloat('#0.00', AValue);
//
//  result := format(MSG, [APropName]) + lValue;
//
//end;
//
//class function TValidatorStringGenerator.CreateGreaterValidatorMsg(
//  AObject: TtiObject; const APropName: string; AValue: Variant): string;
//const
//  MSG = 'Value of %s must be greater than %s.';
//begin
//  result := format(MSG, [APropName, GetValueAsString(AObject, APropName, AValue)]);
//end;
//
//class function TValidatorStringGenerator.CreateLessThanOrEqualValidatorMsg(
//  AObject: TtiObject; const APropName: string; AValue: Variant): string;
//const
//  MSG = 'Value of %s must be greater than or equal to %s.';
//begin
//  result := format(MSG, [APropName, GetValueAsString(AObject, APropName, AValue)]);
//end;
//
//class function TValidatorStringGenerator.CreateLessThanValidatorMsg(
//  AObject: TtiObject; const APropName: string; AValue: Variant): string;
//const
//  MSG = 'Value of %s must be less than or equal to %s.';
//begin
//  result := format(MSG, [APropName, GetValueAsString(AObject, APropName, AValue)]);
//end;
//
//class function TValidatorStringGenerator.CreateNotEqualToValidatorMsg(
//  AObject: TtiObject; const APropName: string; AValue: Variant): string;
//const
//  MSG = 'Value of %s must not equal to %s.';
//begin
//  result := format(MSG, [APropName, GetValueAsString(AObject, APropName, AValue)]);
//end;
//
//class function TValidatorStringGenerator.CreateRequiredValidatorMsg(
//  AObject: TtiObject; const APropName: string): string;
//const
//  MSG = '%s must have a value.';
//begin
//  result := format(MSG, [APropName]);
//end;
//
//class function TValidatorStringGenerator.GetValueAsString(AObject: TtiObject;
//  const APropName: string; AValue: Variant): string;
//var
//  lType: TtiTypeKind;
//begin
//  lType := tiGetSimplePropType(AObject, APropName);
//
//  case lType of
//    tiTKInteger:
//      result := IntToStr(AValue);
//    tiTKBinary:
//      result := BoolToStr(AValue, true);
//    tiTKDateTime:
//      result := DateToStr(AValue);
//    tiTKFloat:
//      result := FormatFloat('#0.00', AValue);
//    tiTKString:
//      result := AValue;
//    else
//      raise Exception.Create('Value out of range');
//  end;
//end;

{TgMapProjectIncludeFile}

procedure TgMapProjectIncludeFile.SetIncludeFilename(const AValue: String);
begin
  if FIncludeFilename <> AValue then
  begin
    FIncludeFilename := AValue;
    NotifyObservers(self, noChanged);
  end;
end;

function TgMapProjectIncludeFile.Clone: TgMapProjectIncludeFile;
begin
  result := TgMapProjectIncludeFile.Create;
  result.Assign(self);
end;

{TgMapProjectIncludeFileList }

procedure TgMapProjectIncludeFileList.Add(AObject: TgMapProjectIncludeFile);
begin
  inherited Add(AObject);
end;

function TgMapProjectIncludeFileList.Clone: TgMapProjectIncludeFileList;
begin
  result := TgMapProjectIncludeFileList.Create;
  result.Assign(self);
end;

function TgMapProjectIncludeFileList.GetItems(i: integer): TgMapProjectIncludeFile;
begin
  Result := inherited GetItems(i) as TgMapProjectIncludeFile;
end;

procedure TgMapProjectIncludeFileList.SetItems(i: integer; const AObject: TgMapProjectIncludeFile);
begin
  inherited SetItems(i, AObject);
end;

function TgMapProjectIncludeFileList.FindByIncludeFileName(const AName: string
  ): TgMapProjectIncludeFile;
var
  lCtr: integer;
  lName: string;
begin
  result := nil;

  lName := LowerCase(AName);

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].IncludeFilename) = lName then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

class function TgMapProjectIncludeFileList.BaseItemType: TClass;
begin
  result := TgMapProjectIncludeFile;
end;

{TgMapUnitReference}

procedure TgMapUnitReference.SetReference(const AValue: string);
begin
  if FUnitReference <> AValue then
    FUnitReference := AValue;
end;

function TgMapUnitReference.Clone: TgMapUnitReference;
begin
  result := TgMapUnitReference.Create;
  result.Assign(self);
end;

{TgMapUnitReferenceList }

procedure TgMapUnitReferenceList.Add(AObject: TgMapUnitReference);
begin
  inherited Add(AObject);
end;

function TgMapUnitReferenceList.Clone: TgMapUnitReferenceList;
begin
  result := TgMapUnitReferenceList.Create;
  result.Assign(self);
end;

function TgMapUnitReferenceList.FindByUnitReference(const AName: string
  ): TgMapUnitReference;
var
  lCtr: integer;
  lName: string;
begin
  result := nil;

  lName := LowerCase(AName);

  for lCtr := 0 to Count - 1 do
    begin
      if LowerCase(Items[lCtr].UnitReference) = lName then
        begin
          result := Items[lCtr];
          exit;
        end;
    end;
end;

class function TgMapUnitReferenceList.BaseItemType: TClass;
begin
  result := TgMapUnitReference;
end;

function TgMapUnitReferenceList.GetItems(i: integer): TgMapUnitReference;
begin
  Result := inherited GetItems(i) as TgMapUnitReference;
end;

procedure TgMapUnitReferenceList.SetItems(i: integer; const AObject: TgMapUnitReference);
begin
  inherited SetItems(i, AObject);
end;

//initialization
//  ValidatorStringClass := TValidatorStringGenerator;

end.
