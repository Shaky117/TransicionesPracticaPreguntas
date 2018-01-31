//
//  Pregunta.swift
//  TransicionesPracticaImagenes
//
//  Created by Maestro on 31/01/18.
//  Copyright © 2018 Maestro. All rights reserved.
//

import Foundation
import UIKit

class Pregunta{
    
    var imagen : UIImage
    var pregunta : String = ""
    var respuesta : Bool
    
    init(imagen : UIImage, pregunta : String, respuesta : Bool) {
        self.imagen = imagen
        self.pregunta = pregunta
        self.respuesta = respuesta
    }
 
}
