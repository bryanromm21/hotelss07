<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LostReportsResource\Pages;
use App\Filament\Resources\LostReportsResource\RelationManagers;
use App\Models\LostReports;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TagsInput;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Fields\Date;
use Filament\Forms\Fields\Number;

class LostReportsResource extends Resource
{
    protected static ?string $model = LostReports::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Informe de Perdidos';
    protected static ?string $modelLabel = 'Informe de Perdidos';
    protected static ?string $navigationGroup = 'Informes';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //'departamento', 'descripcion', 'date of foud','photo', 'personals_id', 'rooms_id'
                Forms\Components\Select::make('departaments_id')
                ->label('departamento')
                ->relationship('departaments','departaments')
                ->required()
                ->searchable()
                ->preload(),
                RichEditor::make('descripcion')
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
                Forms\Components\DatePicker:: make('date of foud')
                ->label('fecha')
                ->required(),
                Forms\Components\FileUpload::make('photo')
                ->label('foto')
                    ->image()
                    ->visibility('private')
                    ->directory('LostReports')
                    ->preserveFilenames(),
                Forms\Components\Select :: make('personals_id')
                ->label('personal')
                ->relationship('personals','name')
                ->required()
                ->searchable()
                ->preload(),
                Forms\Components\Select :: make('rooms_id')
                ->label('habitaciom')
                ->relationship('rooms','rooms_number')
                ->required()
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('specials_areas_id')
                ->label('Area especial')
                ->relationship('specials_areas','Area')
                ->searchable()
                ->preload(),
            ]);

    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('personals.name')
                ->numeric()
                ->sortable(),
                Tables\Columns\TextColumn::make('personals.positions.positions')
            ->label('cargo')
                ->numeric()
                ->sortable(),
            Tables\Columns\TextColumn::make('departaments.departaments')
            ->label('departamento')
                ->numeric()
                ->sortable(),
            TextColumn::make('descripcion')
            ->html()
            ->wrap()
            ->searchable(),
            TextColumn::make('date of foud')->date()->sortable(),
            Tables\Columns\TextColumn::make('rooms.rooms_number')
                ->numeric()
                ->sortable(),
            ImageColumn::make('photo')->rounded()
            ->label('foto'),
                Tables\Columns\TextColumn::make('created_at')
                ->dateTime()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
            Tables\Columns\TextColumn::make('updated_at')
                ->dateTime()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
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
            'index' => Pages\ListLostReports::route('/'),
            'create' => Pages\CreateLostReports::route('/create'),
            'edit' => Pages\EditLostReports::route('/{record}/edit'),
        ];
    }
}
