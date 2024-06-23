<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ActivityreportsResource\Pages;
use App\Filament\Resources\ActivityreportsResource\RelationManagers;
use App\Models\Activityreports;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\RichEditor;
use Forms\Components\DateTimePicker;
use Forms\Components\Select;
use Forms\Components\DatePicker;
use Forms\Components\TimePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TagsInput;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Fields\Date;
use Filament\Forms\Fields\Number;

class ActivityreportsResource extends Resource
{
    protected static ?string $model = Activityreports::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    protected static ?string $navigationLabel = 'Informe de Actividades';
    protected static ?string $modelLabel = 'Informe de Actividades';
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
    Forms\Components\RichEditor::make('observaciones')
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
    Forms\Components\Select::make('progress')
    ->label('progreso')
            ->options(Activityreports::$activityreportsType)
            ->required()
    ->searchable()
            ->preload(),                            
            //->multiple(),
            Forms\Components\DatePicker:: make('departure date')
                ->label('fecha')
                ->required(),
                Forms\Components\TimePicker:: make('entry time')
                ->label('tiempo entrada')
                ->required(),
                Forms\Components\TimePicker:: make('departure time')
                ->label('tiempo salida')
                ->required(),

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
                
                Forms\Components\Select::make('lost_reports_id')
                    ->label('insetar perdido')
                    ->relationship(name:'lost_reports',titleAttribute:('descripcion'))
                    ->createOptionForm([
                        Forms\Components\Select::make('personals_id')
                        ->relationship('personals','name')
                        ->searchable()
                        ->preload(),
                        Forms\Components\Select::make('departaments_id')
                        ->relationship('departaments','departaments')
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
                
                Forms\Components\Select :: make('rooms_id')
                ->label('habitaciom')
                ->relationship('rooms','rooms')
                
                ->searchable()
                ->preload(),
                Forms\Components\Select::make('specials_areas_id')
                ->label('Area especial')
                ->relationship('specials_areas','Area')
                ->searchable()
                ->preload(),
                Forms\Components\FileUpload::make('photo')
                ->label('foto')
                    ->image()
                    ->visibility('private')
                    ->directory('lost_report')
                    ->preserveFilenames(),
                  ]),
                
            ]);

    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('personals.name')
                    ->label('Personal')
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
                    Tables\Columns\TextColumn::make('descripcion')
                ->html()
                ->wrap()
                ->searchable(),
                Tables\Columns\TextColumn::make('observaciones')
                ->html()
                ->wrap()
                ->searchable(),
                Tables\Columns\SelectColumn::make('progress')
                ->label('progreso')
                ->options(Activityreports::$activityreportsType) 
                ->searchable(),
                    Tables\Columns\TextColumn::make('departure date')
                    ->label('Fecha de actividad')
                        ->date()
                        ->sortable(),
                        Tables\Columns\TextColumn::make('entry time')
                ->label('Fecha de actividad')
                    ->Time()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('departure time')
                    ->label('Fecha de actividad')
                        ->Time()
                        ->sortable(),
                        Tables\Columns\TextColumn::make('rooms.rooms_number')
                        ->label('numero de habitacion')
                            ->numeric()
                            ->sortable(),
                            Tables\Columns\TextColumn::make('specials_areas.Area')
                            ->label('area')
                                ->numeric()
                                ->sortable(),
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
            'index' => Pages\ListActivityreports::route('/'),
            'create' => Pages\CreateActivityreports::route('/create'),
            'edit' => Pages\EditActivityreports::route('/{record}/edit'),
        ];
    }
}
