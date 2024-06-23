<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PersonalResource\Pages;
use App\Filament\Resources\PersonalResource\RelationManagers;
use App\Models\Personal;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Models\Person;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\TagsInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Fields\Date;
use Filament\Forms\Fields\Number;

class PersonalResource extends Resource
{
    protected static ?string $model = Personal::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Personales';
    protected static ?string $modelLabel = 'Personales';
    protected static ?string $navigationGroup = 'Gestion personal';
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                ->label('Nombre')
                    ->required()
                    ->maxLength(255),
                FileUpload::make('photo')
                ->label('foto')
                    ->image()
                    ->visibility('private')
                    ->directory('Personals')
                    ->preserveFilenames(),
                Forms\Components\TextInput::make('age')
                ->label('Edad')
                    ->required()
                    ->numeric(),
                Forms\Components\DatePicker::make('birthdate')
                ->label('Nacimiento')
                    ->required(),
                Forms\Components\TextInput::make('CI')
                    ,
                Forms\Components\TextInput::make('nationality')
                    ,
                Forms\Components\TextInput::make('passport')
                    ,
                Forms\Components\Select::make('sex')
                ->label('Sex')
                ->label('Genero')
                            ->options(Personal::$sexPersonal)
                            ->required()
                    ->searchable()
                            ->preload()
                    ->required(),
                Forms\Components\TextInput::make('email')
                ->email()
                ->required(),
                Forms\Components\TextInput::make('emergency_contac')
                ->label('contacto de emergencia')
                ->default('591')
                ->prefix('+')
                ->label('Contacto')
                ->label('Contacto Enmergencia')
                ->tel()
                ->telRegex('/^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/')
                    ->required()
                    ->numeric(),
                    Forms\Components\Select::make('positions_id')
                    ->label('Cargo')
                ->label('Cargo')
                    ->relationship(name:'positions',titleAttribute:'positions')
                    ->createOptionForm([
                        Forms\Components\TextInput::make('positions')
                    ->required()
                ]),
                Forms\Components\Select::make('equips_id')
                ->label('equipo')
                ->relationship(name:'equips',titleAttribute:'name')
                ->createOptionForm([
                        Forms\Components\TextInput::make('name')
                        ->required()
                ])
                ,
                    Forms\Components\Select::make('users_id')
                    ->label('usuario')
                    ->relationship(name:'users',titleAttribute:'name')
                    ->createOptionForm([
                        Forms\Components\TextInput::make('name')
                        ->required(),
                        Forms\Components\TextInput::make('email')
                    ->email(),
                    Forms\Components\TextInput::make('password')
                    ->password()
                    ->required(),
                    Forms\Components\Select::make('roles')
                    ->label('roles')
    ->relationship('roles', 'name')
    ->multiple()
    ->preload()
    ->searchable()
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                ->label('nombre')
                    ->searchable(),
                ImageColumn::make('photo')->rounded()
                ->label('foto'),
                Tables\Columns\TextColumn::make('age')
                ->label('edad')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('birthdate')
                ->label('nacimiento')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('sex')
                ->label('genero'),
                Tables\Columns\TextColumn::make('CI'),
                Tables\Columns\TextColumn::make('emergency_contac')
                ->label('contacto de emergencia')
                ->searchable(),
                Tables\Columns\TextColumn::make('positions.positions')
                 ->label('fecha')
                    ->numeric()
                    ->sortable(),
                  
                Tables\Columns\TextColumn::make('equips.name')
                ->label('equipo')
                    ->numeric()
                    ->sortable(),
                    Tables\Columns\TextColumn::make('users.email')
                    ->label('Usuario')
                       ->numeric()
                       ->sortable(),
                    
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
            'index' => Pages\ListPersonals::route('/'),
            'create' => Pages\CreatePersonal::route('/create'),
            'edit' => Pages\EditPersonal::route('/{record}/edit'),
        ];
    }
}
