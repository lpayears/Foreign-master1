package com.lpa.controller;

import com.lpa.entity.Client;
import com.lpa.service.ClientService;
import com.lpa.utils.Message;
import com.lpa.utils.PageInfo;
import com.lpa.utils.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClientController {
    @Resource
    ClientService clientService;

    @RequestMapping(value = "/addClient",method = RequestMethod.POST)
    public Message addClient(Client client){
        clientService.addClient(client);
        return Message.success();
    }

    @RequestMapping(value = "/getClient/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Message getClientByID(@PathVariable("id") int id){
        Client client = clientService.getClientById(id);
        return Message.success().add("client",client);
    }

    @RequestMapping(value = "/updateClient/{id}",method = RequestMethod.POST)
    @ResponseBody
    public Message updateClient( Client client){
        clientService.updateClient(client);
        return Message.success();
    }

    @RequestMapping(value = "/delClient/{id}",method = RequestMethod.DELETE)
    public Response delClient(@PathVariable("id")int id){
        return clientService.delClient(id);
    }

    @RequestMapping(value = "/getClients",method = RequestMethod.GET)
    @ResponseBody
    public Message getClients(){
        List<Client> clients = clientService.getAllClient();
        return Message.success().add("clients",clients);
    }

    @RequestMapping(value = "/getClientList",method = RequestMethod.GET)
    @ResponseBody
    public Message getClientList(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Client client){
        Map<String,Long> map = new HashMap<String, Long>();
        List<Client> clients = clientService.getClientList(pn,map,client);
        Long total = (long) map.get("total").intValue();
        PageInfo<?> pageInfo = new PageInfo<>(clients,5,total,5,pn);
        return Message.success().add("pageInfo",pageInfo);
    }
}
