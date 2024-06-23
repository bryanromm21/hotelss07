<?php

namespace App\Filament\Resources;

use App\Filament\Resources\FaultreportsResource\Pages;
use App\Filament\Resources\FaultreportsResource\RelationManagers;
use App\Models\Faultreports;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Forms\Components\Select;
use Forms\Components\RichEditor;
use Forms\Components\DatePicker;
use  Forms\Components\FileUpload;
use Tables\Columns\ImageColumn;
use ables\Columns\TextColumn;
class FaultreportsResource extends Resource
{
    protected static ?string $model = Faultreports::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Informe de Averias';
    protected static ?string $modelLabel = 'Informe de Averias';
    protected static ?string $navigationGroup = 'Informes';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('personals_id')
                ->label('Personal')
                ->relationship('personals','name')
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('departaments_id')
                ->label('departamento')
                ->relationship('departaments','departaments')
                ->required()
                ->searchable()
                ->preload(),
                Forms\Components\RichEditor::make('descripcion')
    ->toolbarButtons([
        'attachFiles',
        'blockquote',
        'bold',
        'bulletList',
        'codeBlock',
        'h2',
        'h3',
        'italic',
        'link',
        'orderedList',
        'redo',
        'strike',
        'underline',
        'undo',
    ]),
    Forms\Components\DatePicker:: make('date')
    ->label('fecha')
    ->required(),
                Forms\Components\FileUpload::make('photo')
                ->label('foto')
                ->image()
                ->visibility('private')
                ->directory('faultreports')
                ->preserveFilenames(),
                Forms\Components\Select::make('rooms_id')
                ->label('numero de habitacion')
                ->relationship('rooms','rooms_number')
                ->searchable()
                ->preload(),
                
                Forms\Components\Select::make('specials_areas_id')
                ->label('Area')
                ->relationship('specials_areas','Area')
                ->searchable()
                ->preload(),
                
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('rooms.rooms_number')
                ->label('numero de habitacion')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('specials_areas.Area')
                ->label('Area')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('personals.name')
                    ->label('Personal')
                        ->numeric()
                        ->sortable(),
                Tables\Columns\TextColumn::make('departaments.departaments')
                ->label('departamento')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('personals.positions.positions')
                ->label('cargo')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('descripcion')
                ->html()
                ->wrap()
                ->searchable(),
                Tables\Columns\ImageColumn::make('photo')->rounded()
                ->label('foto'),
                Tables\Columns\TextColumn::make('date')->date()->label('fecha')->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make()->label('vista'),
                Tables\Actions\EditAction::make()->label('editar'),
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
            'index' => Pages\ListFaultreports::route('/'),
            'create' => Pages\CreateFaultreports::route('/create'),
            'edit' => Pages\EditFaultreports::route('/{record}/edit'),
        ];
    }
}
