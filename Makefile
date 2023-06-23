# Compiler settings
FC = gfortran

# List of module files
MODULES = functions.mod converter.mod lattice_maker.mod helper.mod

# Main program
PROGRAM = action

# Object files
OBJECTS = convert.o lattice.o metropolis.o action.o 

# Source files
SOURCES =  convert.f90 lattice.f90  metropolis.f90 action.f90

# Default target
all: $(PROGRAM)



#Compilation rules for object files
%.o:%.f90
	$(FC) -c -o $@ $<

# Compilation rules for module files
%.mod: %.f90
	$(FC) -c $<

# Main program compilation
$(PROGRAM): $(OBJECTS)
	$(FC) -o $(PROGRAM) $(OBJECTS)


# Clean target
clean:
	rm -f $(PROGRAM) $(MODULES) $(OBJECTS) *.png *.txt *.exe