unit UntPedidos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, MultiDetailAppearanceU,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope,
  FMX.Edit, FMX.ListBox, System.Actions, FMX.ActnList, UntCadCli;

type
  TfrmPedidos = class(TForm)
    lytBase: TLayout;
    tbctrlPrincipal: TTabControl;
    tbitemListagem: TTabItem;
    tbitemEdicao: TTabItem;
    ToolBar1: TToolBar;
    spbMenu: TSpeedButton;
    lblTituloLista: TLabel;
    spbNovo: TSpeedButton;
    lsviewPedidos: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    lstPedido: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    Label1: TLabel;
    edtCliente: TEdit;
    ListBoxItem5: TListBoxItem;
    tbitemItens: TTabItem;
    tbitemApoio: TTabItem;
    lytApoio: TLayout;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    ToolBar2: TToolBar;
    spbRetPedidos: TSpeedButton;
    Label2: TLabel;
    spbSelCli: TSpeedButton;
    LinkPropertyToFieldItemDataDetail: TLinkPropertyToField;
    ToolBar3: TToolBar;
    SpeedButton1: TSpeedButton;
    procedure spbMenuClick(Sender: TObject);
    procedure lsviewPedidosItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure spbRetPedidosClick(Sender: TObject);
    procedure spbNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spbSelCliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.fmx}

uses
  UntPrincipal,
  UntDM;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  tbctrlPrincipal.ActiveTab   := tbitemListagem;
  tbctrlPrincipal.TabPosition := TTabPosition.None;
  DM.qryPedidos.Active := True;
end;

procedure TfrmPedidos.lsviewPedidosItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  MudarAba(tbitemItens, Sender);
end;

procedure TfrmPedidos.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

procedure TfrmPedidos.spbMenuClick(Sender: TObject);
begin
  frmPrincipal.MudarAba(frmPrincipal.tbitemMenu, Sender);
end;

procedure TfrmPedidos.spbNovoClick(Sender: TObject);
begin
  DM.qryPedidos.Append;
  DM.qryPedidosNUM_PEDIDO.AsInteger := DM.GetNewID('PEDIDOS', 'NUM_PEDIDO');
  DM.qryPedidosID.AsString          := frmPrincipal.FLib.GetObjectID;
  MudarAba(tbitemEdicao, Sender);
end;

procedure TfrmPedidos.spbRetPedidosClick(Sender: TObject);
begin
  MudarAba(tbitemListagem, Sender);
end;

procedure TfrmPedidos.spbSelCliClick(Sender: TObject);
var
  LayoutBase : TComponent;
begin
  //Cria o formulário de Clientes
  Application.CreateForm(TfrmCadCli, frmCadCli);

  LayoutBase := frmCadCli.FindComponent('lytBase');
  if Assigned(LayoutBase) then
    lytApoio.AddObject(TLayout(LayoutBase));

  MudarAba(tbitemApoio, Sender);
end;

procedure TfrmPedidos.SpeedButton1Click(Sender: TObject);
begin
  MudarAba(tbitemListagem, Sender);
end;

end.
