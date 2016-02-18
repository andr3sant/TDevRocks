unit UntCadModelo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, FMX.Layouts, System.Actions,
  FMX.ActnList;

type
  TfrmCadModelo = class(TForm)
    lytBase: TLayout;
    tbctrlPrincipal: TTabControl;
    tbitemListagem: TTabItem;
    tbitemEdicao: TTabItem;
    toolSuperior: TToolBar;
    spbVoltar: TSpeedButton;
    lblTitulo: TLabel;
    ActionList1: TActionList;
    actMudarAba: TChangeTabAction;
    procedure spbVoltarClick(Sender: TObject);
  private
    { Private declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmCadModelo: TfrmCadModelo;

implementation

{$R *.fmx}

uses
  UntPrincipal;

procedure TfrmCadModelo.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

procedure TfrmCadModelo.spbVoltarClick(Sender: TObject);
begin
  frmPrincipal.MudarAba(frmPrincipal.tbitemMenu, Sender);
end;

end.