<?php

namespace App\Filament\Resources;

use App\Filament\Resources\StockResource\Pages;
use App\Filament\Resources\StockResource\RelationManagers;
use App\Models\Stock;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Forms\Components\Textarea;
use Forms\Components\FileUpload;
use Forms\Components\DatePicker;
use Forms\Components\TextInput;
use Forms\Components\Select;
use Tables\Columns\TextColumn;
use Tables\Columns\ImageColumn;
class StockResource extends Resource
{
    protected static ?string $model = Stock::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationGroup = 'Almacen ';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //['description','photo','date_entry','amount','personals_id','departaments_id','products_id'];
                Forms\Components\Textarea::make('description')
                ->label('descripcion')
                    ->required()
                    ->columnSpanFull(),
                    Forms\Components\FileUpload::make('photo')
                    ->label('foto ')
                ->image()
                ->visibility('private')
                ->directory('stock')
                ->preserveFilenames(),
                Forms\Components\TextInput::make('amount')
                ->label('cantidad')
                ->required()
                ->numeric(),
                    Forms\Components\DatePicker::make('date_entry')
                    ->label('fecha')
                    ->required(),
                    Forms\Components\Select::make('personals_id')
                    ->label('personal')
                    ->relationship('personals','name')
                    ->required()
                    ->searchable()
                    ->preload(),
                    Forms\Components\Select::make('departaments_id')
                    ->label('departamento')
                    ->relationship('departaments','departaments')
                    ->required()
                    ->searchable()
                    ->preload(),
                    Forms\Components\Select::make('products_id')
                    ->label('producto')
                    ->relationship('products','products')
                    ->required()
                    ->searchable()
                    ->preload(),
                    
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //['description','photo','date_entry','amount','personals_id','departaments_id','products_id'];
                Tables\Columns\TextColumn::make('description')
                ->label('descripcion')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\ImageColumn::make('photo')
                    ->label('foto')
                    ->rounded(),
                    Tables\Columns\TextColumn::make('date_entry')
                    ->label('fecha de entrada')
                    ->date()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('amount')
                    ->label('cantidad')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('products.products')
                    ->label('producto')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('products.brand')
                    ->label('marca')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('products.category.categories')
                    ->label('categoria')
                    ->numeric()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make()->label('vista'),
                Tables\Actions\EditAction::make()->label('Editar'),
                Tables\Actions\DeleteAction::make()->label('Borrar'),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListStocks::route('/'),
            'create' => Pages\CreateStock::route('/create'),
            'edit' => Pages\EditStock::route('/{record}/edit'),
        ];
    }
}
