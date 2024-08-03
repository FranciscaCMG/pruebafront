import { Box, Button, Grid, MenuItem, TextField } from "@mui/material";
import axios from "axios";
import { useEffect, useState } from "react";
import OutboxIcon from '@mui/icons-material/Outbox';


const marcas = [

    {
        value: 1,
        label: 'Toyota',
    },
    {
        value: 2,
        label: 'Kia',
    },
    {
        value: 3,
        label: 'Honda',
    },
    {
        value: 4,
        label: 'Ford',

    },
    {
        value: 5,
        label: 'Chevrolet',
    },
    {
        value: 6,
        label: 'Hyundai',
    },
];

const modelos = [

    {
        value: 1,
        label: 'Sedan',
    },
    {
        value: 2,
        label: 'Hatchback',
    },
    {
        value: 3,
        label: 'SUV',
    },
    {
        value: 4,
        label: 'Pickup',
    },
    {
        value: 5,
        label: 'Furgoneta',
    },
];



const tipos = [

    {
        value: 1,
        label: 'Gasolina',
    },
    {
        value: 2,
        label: 'Diésel',
    },
    {
        value: 3,
        label: 'Híbrido',
    },
    {
        value: 4,
        label: 'Eléctrico',

    },
];

export default function Registro() {

    const [patente, setPatente] = useState("");
    const [marca, setMarca] = useState("");
    const [modelo, setModelo] = useState("");
    const [tipo, setTipo] = useState("");
    const [anio, setAnio] = useState("");
    const [asientos, setAsientos] = useState("");
    const [kilometraje, setKilometraje] = useState("");

    const [error, setError] = useState(
        {
            errorPatente: false,
            errorMarca: false,
            errorModelo: false,
            errorTipoAuto: false,
            errorAnio: false,
            errorAsientos: false,
            errorKilometraje: false,
            message: 'Este campo es requerido',

        }
    );
    const [helperText, setHelperText] = useState('');

    const handleSubmit = (e) => {
        e.preventDefault();
        if (!patente || !marca || !modelo || !tipo || !anio || !asientos || !kilometraje) {
            setError({
                ...error,
                errorPatente: !patente,
                errorMarca: !marca,
                errorModelo: !modelo,
                errorTipoAuto: !tipo,
                errorAnio: !anio,
                errorAsientos: !asientos,
                errorKilometraje: !kilometraje,
            });
            setHelperText('Este campo es requerido');
        } else {
            setError({
                errorPatente: false,
                errorMarca: false,
                errorModelo: false,
                errorTipoAuto: false,
                errorAnio: false,
                errorAsientos: false,
                errorKilometraje: false,
                message: 'Este campo es requerido',
            });
            axios.
                post('http://localhost:8080/vehiculos/vehiculo', {

                    n_patente: patente.toLocaleUpperCase(),
                    id_marca: marca,
                    id_modelo: modelo,
                    id_tipo_auto: tipo,
                    anio_frabricacion: anio,
                    n_asientos: asientos,
                    kilometraje: kilometraje
                })
                .then(response => {
                    console.log(response);
                    window.location.reload();
                })
            alert('Vehículo ingresado correctamente');
        }
    }

    return (
        <>

            <h1 style={{ textAlign: 'center' }}>Registro de Vehículos</h1>
            <Box
                component="form"
                onSubmit={handleSubmit}
                sx={{
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                    '& > :not(style)': { m: 1 },
                }}
                noValidate
                autoComplete="off"
            >
                <Grid container spacing={2} >

                    <Grid item xs={6}>
                        <h4>Patente</h4>
                        <TextField

                            id="patente"
                            label="Ingrese la patente del vehículo"
                            fullWidth
                            error={error.errorPatente}
                            helperText={error.errorPatente ? helperText : ''}
                            required
                            value={patente}
                            onChange={(e) => setPatente(e.target.value.toUpperCase())}

                        > </TextField>
                    </Grid>
                    <Grid item xs={6}>

                        <h4>Marca</h4>
                        <TextField

                            id="marca"
                            select
                            label="Ingrese la marca del vehículo"
                            fullWidth
                            error={error.errorMarca}
                            helperText={error.errorMarca ? helperText : ''}
                            required
                            value={marca}
                            onChange={(e) => setMarca(e.target.value)}
                        >
                            {marcas.map((option) => (
                                <MenuItem key={option.value} value={option.value}>
                                    {option.label}
                                </MenuItem>
                            ))}
                        </TextField>
                    </Grid>
                    <Grid item xs={6}>
                        <h4>Modelo</h4>
                        <TextField
                            id="modelo"
                            select
                            label="Ingrese el modelo del vehículo"
                            fullWidth
                            error={error.errorModelo}
                            helperText={error.errorModelo ? helperText : ''}
                            required
                            value={modelo}
                            onChange={(e) => setModelo(e.target.value)}
                        >
                            {modelos.map((option) => (
                                <MenuItem key={option.value} value={option.value}>
                                    {option.label}
                                </MenuItem>
                            ))}
                        </TextField>
                    </Grid>
                    <Grid item xs={6}>

                        <h4>Tipo Motor</h4>
                        <TextField

                            id="tipo"
                            select
                            label="Ingrese el tipo de motor del vehículo"
                            fullWidth
                            error={error.errorTipoAuto}
                            helperText={error.errorTipoAuto ? helperText : ''}
                            required
                            value={tipo}
                            onChange={(e) => setTipo(e.target.value)}
                        >
                            {tipos.map((option) => (
                                <MenuItem key={option.value} value={option.value}>
                                    {option.label}
                                </MenuItem>
                            ))}
                        </TextField>

                    </Grid>
                    <Grid item xs={6}>
                        <h4>Año Fabricación</h4>
                        <TextField
                            id="anio"
                            label="Ingrese el año de fabricación del vehículo"
                            fullWidth
                            error={error.errorAnio}
                            helperText={error.errorAnio ? helperText : ''}
                            required
                            value={anio}
                            onChange={(e) => setAnio(e.target.value.toUpperCase())}

                        > </TextField>
                    </Grid>

                    <Grid item xs={6}>
                        <h4>Número Asientos</h4>
                        <TextField
                            id="asientos"
                            label="Ingrese el número de asientos del vehículo"
                            fullWidth
                            error={error.errorAsientos}
                            helperText={error.errorAsientos ? helperText : ''}
                            required
                            value={asientos}
                            onChange={(e) => setAsientos(e.target.value)}

                        > </TextField>
                    </Grid>
                    <Grid item xs={6}>
                        <h4>Kilometraje</h4>
                        <TextField
                            id="kilometraje"
                            label="Ingrese el kilometraje del vehículo"
                            fullWidth
                            error={error.errorKilometraje}
                            helperText={error.errorKilometraje ? helperText : ''}
                            required
                            value={kilometraje}
                            onChange={(e) => setKilometraje(e.target.value)}

                        > </TextField>
                    </Grid>

                </Grid>
                <div>
                    <Button
                        startIcon={<OutboxIcon />}
                        type="submit"
                        variant="contained"
                        sx={{ mt: 30, mb: 2, width: '20rem', marginTop: '2rem' }}
                    >Ingresar Vehículo</Button>
                </div>
            </Box>
        </>
    );
}